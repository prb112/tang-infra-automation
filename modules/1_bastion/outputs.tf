################################################################
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Licensed Materials - Property of IBM
#
# ©Copyright IBM Corp. 2022
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
################################################################

output "bastion_ip" {
  depends_on = [null_resource.bastion_init]
  value      = data.ibm_pi_instance_ip.bastion_ip.*.ip
}

output "bastion_public_ip" {
  depends_on = [null_resource.bastion_packages]
  value      = data.ibm_pi_instance_ip.bastion_public_ip[0].*.external_ip
}

output "bastion_instance_ids" {
  depends_on = [null_resource.bastion_packages]
  value      = split("/", ibm_pi_instance.bastion[0].id)[1]
}

output "bastion_network" {
  depends_on = [null_resource.bastion_packages]
  value      = data.ibm_pi_network.network.id
}