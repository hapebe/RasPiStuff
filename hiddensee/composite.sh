#!/bin/bash
# transition from a to b, the number means percentage of completion
composite -blend 0 b.jpg a.jpg a-b-000.jpg
composite -blend 20 b.jpg a.jpg a-b-020.jpg
composite -blend 50 b.jpg a.jpg a-b-050.jpg
composite -blend 80 b.jpg a.jpg a-b-080.jpg
composite -blend 100 b.jpg a.jpg a-b-100.jpg
