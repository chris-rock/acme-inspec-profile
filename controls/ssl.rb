# encoding: utf-8
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# author: Christoph Hartmann
# author: Joe Gardiner

# TODO: switch to ssl-benchmark
# include_controls 'ssl-benchmark'

control 'tls1.2' do
  title 'Run TLS 1.2 whenever SSL is active on a port'
  impact 0.5
  describe ssl(port: 443).protocols('tls1.2') do
    it { should be_enabled }
  end
end

control 'tls1.0' do
  title 'Disable tls1.0 from all exposed ports.'
  impact 0.7
  describe ssl(port: 443).protocols('tls1.0') do
    it { should_not be_enabled }
  end
end

control 'ssl3' do
  title 'Disable SSL3 from all exposed SSL ports.'
  impact 1.0
  describe ssl(port: 443).protocols('ssl3') do
    it { should_not be_enabled }
  end
end
