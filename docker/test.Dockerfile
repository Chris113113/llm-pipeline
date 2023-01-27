# Copyright 2022 Google LLC

# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at

#     https://www.apache.org/licenses/LICENSE-2.0

# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
FROM python:slim

RUN pip install kfp absl-py google-cloud-aiplatform

COPY config/small1vm1gpu.json .
COPY pipelyine.py .

ENTRYPOINT ["python3",  "pipeline.py", "--config=configs/small1vm1gpu.json", "--verify",  "--override_deploy"]
