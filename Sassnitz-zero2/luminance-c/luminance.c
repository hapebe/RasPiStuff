#include <stdio.h>
#include <jpeglib.h>

int main(int argc, char *argv[]) {
    if (argc != 2) {
        printf("Usage: %s image.jpg\n", argv[0]);
        return 1;
    }

    FILE *infile = fopen(argv[1], "rb");
    if (!infile) {
        perror("Error opening file");
        return 1;
    }

    struct jpeg_decompress_struct cinfo;
    struct jpeg_error_mgr jerr;

    cinfo.err = jpeg_std_error(&jerr);
    jpeg_create_decompress(&cinfo);
    jpeg_stdio_src(&cinfo, infile);
    jpeg_read_header(&cinfo, TRUE);
    jpeg_start_decompress(&cinfo);

    int width = cinfo.output_width;
    int height = cinfo.output_height;
    int channels = cinfo.output_components; // should be 3 for RGB

    unsigned long long brightness_sum = 0;
    unsigned long pixel_count = width * height;

    JSAMPARRAY buffer = (*cinfo.mem->alloc_sarray)
        ((j_common_ptr)&cinfo, JPOOL_IMAGE, width * channels, 1);

    while (cinfo.output_scanline < height) {
        jpeg_read_scanlines(&cinfo, buffer, 1);
        unsigned char *row = buffer[0];

        for (int x = 0; x < width; x++) {
            unsigned char r = row[x * channels + 0];
            unsigned char g = row[x * channels + 1];
            unsigned char b = row[x * channels + 2];

            int luminance = (int)(0.299*r + 0.587*g + 0.114*b);
            brightness_sum += luminance;
        }
    }

    double avg_brightness = (double)brightness_sum / pixel_count;
    int avg_brightness_int = (int)(avg_brightness + 0.5);

    // printf("Average brightness: %.2f (0=black, 255=white)\n", avg_brightness);
    printf("%.d", avg_brightness_int);

    jpeg_finish_decompress(&cinfo);
    jpeg_destroy_decompress(&cinfo);
    fclose(infile);

    return 0;
}
