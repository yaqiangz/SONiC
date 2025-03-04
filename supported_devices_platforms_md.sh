!/usr/bin/env bash
git checkout -b sonic_image_md_update
git config --global user.email "sonicbld@microsoft.com"
git config --global user.name "mssonicbld"
git reset --hard
git pull origin sonic_image_md_update


#set -euo pipefail

DEFID_BRCM="$(curl -s 'https://dev.azure.com/mssonic/build/_apis/build/definitions?name=Azure.sonic-buildimage.official.broadcom' | jq -r '.value[0].id')"
DEFID_MLNX="$(curl -s 'https://dev.azure.com/mssonic/build/_apis/build/definitions?name=Azure.sonic-buildimage.official.mellanox' | jq -r '.value[0].id')"
DEFID_VS="$(curl -s 'https://dev.azure.com/mssonic/build/_apis/build/definitions?name=Azure.sonic-buildimage.official.vs' | jq -r '.value[0].id')"
DEFID_INNO="$(curl -s 'https://dev.azure.com/mssonic/build/_apis/build/definitions?name=Azure.sonic-buildimage.official.innovium' | jq -r '.value[0].id')"
DEFID_BFT="$(curl -s 'https://dev.azure.com/mssonic/build/_apis/build/definitions?name=Azure.sonic-buildimage.official.barefoot' | jq -r '.value[0].id')"
DEFID_CHE="$(curl -s 'https://dev.azure.com/mssonic/build/_apis/build/definitions?name=Azure.sonic-buildimage.official.cache' | jq -r '.value[0].id')"
DEFID_CTC="$(curl -s 'https://dev.azure.com/mssonic/build/_apis/build/definitions?name=Azure.sonic-buildimage.official.centec' | jq -r '.value[0].id')"
DEFID_CTC64="$(curl -s 'https://dev.azure.com/mssonic/build/_apis/build/definitions?name=Azure.sonic-buildimage.official.centec-arm64' | jq -r '.value[0].id')"
DEFID_GRC="$(curl -s 'https://dev.azure.com/mssonic/build/_apis/build/definitions?name=Azure.sonic-buildimage.official.generic' | jq -r '.value[0].id')"
DEFID_MRV="$(curl -s 'https://dev.azure.com/mssonic/build/_apis/build/definitions?name=Azure.sonic-buildimage.official.marvell-armhf' | jq -r '.value[0].id')"
DEFID_NPH="$(curl -s 'https://dev.azure.com/mssonic/build/_apis/build/definitions?name=Azure.sonic-buildimage.official.nephos' | jq -r '.value[0].id')"

first=1
for BRANCH in  master   
do
	first=''
	BUILD_BRCM="$(curl -s 'https://dev.azure.com/mssonic/build/_apis/build/builds?definitions='"${DEFID_BRCM}"'&branchName=refs/heads/'"${BRANCH}"'&$top=1&resultFilter=succeeded&api-version=6.0' | jq -r '.value[0].id')"
	BUILD_BRCM_TS="$(curl -s 'https://dev.azure.com/mssonic/build/_apis/build/builds/'"${BUILD_BRCM}"'?api-version=6.0' | jq -r '.queueTime')"
	BUILD_MLNX="$(curl -s 'https://dev.azure.com/mssonic/build/_apis/build/builds?definitions='"${DEFID_MLNX}"'&branchName=refs/heads/'"${BRANCH}"'&$top=1&resultFilter=succeeded&api-version=6.0' | jq -r '.value[0].id')"
	BUILD_MLNX_TS="$(curl -s 'https://dev.azure.com/mssonic/build/_apis/build/builds/'"${BUILD_MLNX}"'?api-version=6.0' | jq -r '.queueTime')"
	BUILD_VS="$(curl -s 'https://dev.azure.com/mssonic/build/_apis/build/builds?definitions='"${DEFID_VS}"'&branchName=refs/heads/'"${BRANCH}"'&$top=1&resultFilter=succeeded&api-version=6.0' | jq -r '.value[0].id')"
	BUILD_VS_TS="$(curl -s 'https://dev.azure.com/mssonic/build/_apis/build/builds/'"${BUILD_VS}"'?api-version=6.0' | jq -r '.queueTime')"
	BUILD_INNO="$(curl -s 'https://dev.azure.com/mssonic/build/_apis/build/builds?definitions='"${DEFID_INNO}"'&branchName=refs/heads/'"${BRANCH}"'&$top=1&resultFilter=succeeded&api-version=6.0' | jq -r '.value[0].id')"
	BUILD_INNO_TS="$(curl -s 'https://dev.azure.com/mssonic/build/_apis/build/builds/'"${BUILD_INNO}"'?api-version=6.0' | jq -r '.queueTime')"
	BUILD_BFT="$(curl -s 'https://dev.azure.com/mssonic/build/_apis/build/builds?definitions='"${DEFID_BFT}"'&branchName=refs/heads/'"${BRANCH}"'&$top=1&resultFilter=succeeded&api-version=6.0' | jq -r '.value[0].id')"
	BUILD_BFT_TS="$(curl -s 'https://dev.azure.com/mssonic/build/_apis/build/builds/'"${BUILD_BFT}"'?api-version=6.0' | jq -r '.queueTime')"
	BUILD_CHE="$(curl -s 'https://dev.azure.com/mssonic/build/_apis/build/builds?definitions='"${DEFID_CHE}"'&branchName=refs/heads/'"${BRANCH}"'&$top=1&resultFilter=succeeded&api-version=6.0' | jq -r '.value[0].id')"
	BUILD_CHE_TS="$(curl -s 'https://dev.azure.com/mssonic/build/_apis/build/builds/'"${BUILD_CHE}"'?api-version=6.0' | jq -r '.queueTime')"
	BUILD_CTC="$(curl -s 'https://dev.azure.com/mssonic/build/_apis/build/builds?definitions='"${DEFID_CTC}"'&branchName=refs/heads/'"${BRANCH}"'&$top=1&resultFilter=succeeded&api-version=6.0' | jq -r '.value[0].id')"
	BUILD_CTC_TS="$(curl -s 'https://dev.azure.com/mssonic/build/_apis/build/builds/'"${BUILD_CTC}"'?api-version=6.0' | jq -r '.queueTime')"
	BUILD_CTC64="$(curl -s 'https://dev.azure.com/mssonic/build/_apis/build/builds?definitions='"${DEFID_CTC64}"'&branchName=refs/heads/'"${BRANCH}"'&$top=1&resultFilter=succeeded&api-version=6.0' | jq -r '.value[0].id')"
	BUILD_CTC64_TS="$(curl -s 'https://dev.azure.com/mssonic/build/_apis/build/builds/'"${BUILD_CTC64}"'?api-version=6.0' | jq -r '.queueTime')"
	BUILD_GRC="$(curl -s 'https://dev.azure.com/mssonic/build/_apis/build/builds?definitions='"${DEFID_GRC}"'&branchName=refs/heads/'"${BRANCH}"'&$top=1&resultFilter=succeeded&api-version=6.0' | jq -r '.value[0].id')"
	BUILD_GRC_TS="$(curl -s 'https://dev.azure.com/mssonic/build/_apis/build/builds/'"${BUILD_GRC}"'?api-version=6.0' | jq -r '.queueTime')"
	BUILD_MRV="$(curl -s 'https://dev.azure.com/mssonic/build/_apis/build/builds?definitions='"${DEFID_MRV}"'&branchName=refs/heads/'"${BRANCH}"'&$top=1&resultFilter=succeeded&api-version=6.0' | jq -r '.value[0].id')"
	BUILD_MRV_TS="$(curl -s 'https://dev.azure.com/mssonic/build/_apis/build/builds/'"${BUILD_MRV}"'?api-version=6.0' | jq -r '.queueTime')"
	BUILD_NPH="$(curl -s 'https://dev.azure.com/mssonic/build/_apis/build/builds?definitions='"${DEFID_NPH}"'&branchName=refs/heads/'"${BRANCH}"'&$top=1&resultFilter=succeeded&api-version=6.0' | jq -r '.value[0].id')"
	BUILD_NPH_TS="$(curl -s 'https://dev.azure.com/mssonic/build/_apis/build/builds/'"${BUILD_NPH}"'?api-version=6.0' | jq -r '.queueTime')"

	#echo " [*] Last successful builds for \"${BRANCH}\":"
	#echo "     Broadcom: ${BUILD_BRCM}"
	#echo "     Mellanox: ${BUILD_MLNX}"
	#echo "     Virtual Switch: ${BUILD_VS}"

	ARTF_BRCM="$(curl -s 'https://dev.azure.com/mssonic/build/_apis/build/builds/'"${BUILD_BRCM}"'/artifacts?artifactName=sonic-buildimage.broadcom&api-version=5.1' | jq -r '.resource.downloadUrl')"
	ARTF_MLNX="$(curl -s 'https://dev.azure.com/mssonic/build/_apis/build/builds/'"${BUILD_MLNX}"'/artifacts?artifactName=sonic-buildimage.mellanox&api-version=5.1' | jq -r '.resource.downloadUrl')"
	ARTF_VS="$(curl -s 'https://dev.azure.com/mssonic/build/_apis/build/builds/'"${BUILD_VS}"'/artifacts?artifactName=sonic-buildimage.vs&api-version=5.1' | jq -r '.resource.downloadUrl')"
	ARTF_INNO="$(curl -s 'https://dev.azure.com/mssonic/build/_apis/build/builds/'"${BUILD_INNO}"'/artifacts?artifactName=sonic-buildimage.innovium&api-version=5.1' | jq -r '.resource.downloadUrl')"
	ARTF_BFT="$(curl -s 'https://dev.azure.com/mssonic/build/_apis/build/builds/'"${BUILD_BFT}"'/artifacts?artifactName=sonic-buildimage.barefoot&api-version=5.1' | jq -r '.resource.downloadUrl')"
	ARTF_CHE="$(curl -s 'https://dev.azure.com/mssonic/build/_apis/build/builds/'"${BUILD_CHE}"'/artifacts?artifactName=sonic-buildimage.cache&api-version=5.1' | jq -r '.resource.downloadUrl')"
	ARTF_CTC="$(curl -s 'https://dev.azure.com/mssonic/build/_apis/build/builds/'"${BUILD_CTC}"'/artifacts?artifactName=sonic-buildimage.centec&api-version=5.1' | jq -r '.resource.downloadUrl')"
	ARTF_CTC64="$(curl -s 'https://dev.azure.com/mssonic/build/_apis/build/builds/'"${BUILD_CTC64}"'/artifacts?artifactName=sonic-buildimage.centec-arm64&api-version=5.1' | jq -r '.resource.downloadUrl')"
	ARTF_GRC="$(curl -s 'https://dev.azure.com/mssonic/build/_apis/build/builds/'"${BUILD_GRC}"'/artifacts?artifactName=sonic-buildimage.generic&api-version=5.1' | jq -r '.resource.downloadUrl')"
	ARTF_MRV="$(curl -s 'https://dev.azure.com/mssonic/build/_apis/build/builds/'"${BUILD_MRV}"'/artifacts?artifactName=sonic-buildimage.marvell-armhf&api-version=5.1' | jq -r '.resource.downloadUrl')"
	ARTF_NPH="$(curl -s 'https://dev.azure.com/mssonic/build/_apis/build/builds/'"${BUILD_NPH}"'/artifacts?artifactName=sonic-buildimage.nephos&api-version=5.1' | jq -r '.resource.downloadUrl')"

echo "# Supported Platforms" > supported_devices_platforms.md

echo "#### Following is the list of platforms that supports SONiC." >> supported_devices_platforms.md
echo "| S.No | Vendor         | Platform       		| ASIC Vendor | Switch ASIC       | Port Configuration  	| Image                                                        |" >> supported_devices_platforms.md
echo "| ---- | -------------- | ----------- | ----------------- | ----------------------- | ------------------------------------------------------------ | ------------------------------------------------------------ |" >> supported_devices_platforms.md
echo "| 1    | Accton    	| AS4630-54PE    		| Broadcom    | Helix 5           | 48x1G + 4x25G + 2x100G  | [SONiC-ONIE-Broadcom]($(echo "${ARTF_BRCM}" | sed 's/format=zip/format=file\&subpath=\/target\/sonic-broadcom.bin/')) |" >> supported_devices_platforms.md
echo "| 2    | Accton    	| AS5712-54X     		| Broadcom    | Trident 2         | 72x10G                  | [SONiC-ONIE-Broadcom]($(echo "${ARTF_BRCM}" | sed 's/format=zip/format=file\&subpath=\/target\/sonic-broadcom.bin/')) |" >> supported_devices_platforms.md
echo "| 3    | Accton    	| AS5812-54X     		| Broadcom    | Trident 2         | 72x10G                  | [SONiC-ONIE-Broadcom]($(echo "${ARTF_BRCM}" | sed 's/format=zip/format=file\&subpath=\/target\/sonic-broadcom.bin/')) |" >> supported_devices_platforms.md
echo "| 4    | Accton    	| AS5835-54T     		| Broadcom    | Trident 3         | 48x10G + 6x100G         | [SONiC-ONIE-Broadcom]($(echo "${ARTF_BRCM}" | sed 's/format=zip/format=file\&subpath=\/target\/sonic-broadcom.bin/')) |" >> supported_devices_platforms.md
echo "| 5    | Accton    	| AS5835-54X     		| Broadcom    | Trident 3         | 48x10G + 6x100G         | [SONiC-ONIE-Broadcom]($(echo "${ARTF_BRCM}" | sed 's/format=zip/format=file\&subpath=\/target\/sonic-broadcom.bin/')) |" >> supported_devices_platforms.md
echo "| 6    | Accton    	| AS6712-32X     		| Broadcom    | Trident 2         | 32x40G                  | [SONiC-ONIE-Broadcom]($(echo "${ARTF_BRCM}" | sed 's/format=zip/format=file\&subpath=\/target\/sonic-broadcom.bin/')) |" >> supported_devices_platforms.md
echo "| 7    | Accton    	| AS7116-54X     		| Nephos      | Taurus            | 48x25G + 6x100G         | [SONiC-ONIE-Nephos]($(echo "${ARTF_NPH}" | sed 's/format=zip/format=file\&subpath=\/target\/sonic-nephos.bin/')) |" >> supported_devices_platforms.md
echo "| 8    | Accton    	| AS7312-54X     		| Broadcom    | Tomahawk          | 48x25G + 6x100G         | [SONiC-ONIE-Broadcom]($(echo "${ARTF_BRCM}" | sed 's/format=zip/format=file\&subpath=\/target\/sonic-broadcom.bin/')) |" >> supported_devices_platforms.md
echo "| 9    | Accton    	| AS7312-54XS    		| Broadcom    | Tomahawk          | 48x25G + 6x100G         | [SONiC-ONIE-Broadcom]($(echo "${ARTF_BRCM}" | sed 's/format=zip/format=file\&subpath=\/target\/sonic-broadcom.bin/')) |" >> supported_devices_platforms.md
echo "| 10   | Accton    	| AS7315-27XB    		| Broadcom    | Qumran            | 20x10G + 4x25G + 3x100G | [SONiC-ONIE-Broadcom]($(echo "${ARTF_BRCM}" | sed 's/format=zip/format=file\&subpath=\/target\/sonic-broadcom.bin/')) |" >> supported_devices_platforms.md
echo "| 11   | Accton    	| AS7326-56X     		| Broadcom    | Trident 3         | 48x25G + 8x100G         | [SONiC-ONIE-Broadcom]($(echo "${ARTF_BRCM}" | sed 's/format=zip/format=file\&subpath=\/target\/sonic-broadcom.bin/')) |" >> supported_devices_platforms.md
echo "| 12   | Accton    	| AS7512-32X     		| Cavium      | XPliantCNX880**   | 32x100G                 | [SONiC-ONIE-Cavium](https://sonic-build.azurewebsites.net/ui/sonic/Pipelines) |" >> supported_devices_platforms.md
echo "| 13   | Accton    	| AS7712-32X     		| Broadcom    | Tomahawk          | 32x100G                 | [SONiC-ONIE-Broadcom]($(echo "${ARTF_BRCM}" | sed 's/format=zip/format=file\&subpath=\/target\/sonic-broadcom.bin/')) |" >> supported_devices_platforms.md
echo "| 14   | Accton    	| AS7716-32X     		| Broadcom    | Tomahawk          | 32x100G                 | [SONiC-ONIE-Broadcom]($(echo "${ARTF_BRCM}" | sed 's/format=zip/format=file\&subpath=\/target\/sonic-broadcom.bin/')) |" >> supported_devices_platforms.md
echo "| 15   | Accton    	| AS7716-32XB    		| Broadcom    | Tomahawk          | 32x100G                 | [SONiC-ONIE-Broadcom]($(echo "${ARTF_BRCM}" | sed 's/format=zip/format=file\&subpath=\/target\/sonic-broadcom.bin/')) |" >> supported_devices_platforms.md
echo "| 16   | Accton    	| AS7726-32X     		| Broadcom    | Trident 3         | 32x100G                 | [SONiC-ONIE-Broadcom]($(echo "${ARTF_BRCM}" | sed 's/format=zip/format=file\&subpath=\/target\/sonic-broadcom.bin/')) |" >> supported_devices_platforms.md
echo "| 17   | Accton    	| AS7816-64X     		| Broadcom    | Tomahawk 2        | 64x100G                 | [SONiC-ONIE-Broadcom]($(echo "${ARTF_BRCM}" | sed 's/format=zip/format=file\&subpath=\/target\/sonic-broadcom.bin/')) |" >> supported_devices_platforms.md
echo "| 18   | Accton    	| AS9716-32D     		| Broadcom    | Tomahawk 3        | 32x400G                 | [SONiC-ONIE-Broadcom]($(echo "${ARTF_BRCM}" | sed 's/format=zip/format=file\&subpath=\/target\/sonic-broadcom.bin/')) |" >> supported_devices_platforms.md
echo "| 19   | Accton    	| Minipack       		| Broadcom    | Tomahawk 3        | 128x100G                | [SONiC-ONIE-Broadcom]($(echo "${ARTF_BRCM}" | sed 's/format=zip/format=file\&subpath=\/target\/sonic-broadcom.bin/')) |" >> supported_devices_platforms.md
echo "| 20   | Alpha<br>Networks | SNH60A0-320Fv2      	| Broadcom    | Tomahawk          | 32x100G                 | [SONiC-ONIE-Broadcom]($(echo "${ARTF_BRCM}" | sed 's/format=zip/format=file\&subpath=\/target\/sonic-broadcom.bin/')) |" >> supported_devices_platforms.md
echo "| 21   | Alpha<br>Networks | SNH60B0-640F        	| Broadcom    | Tomahawk 2         | 64x100G                 | [SONiC-ONIE-Broadcom]($(echo "${ARTF_BRCM}" | sed 's/format=zip/format=file\&subpath=\/target\/sonic-broadcom.bin/')) |" >> supported_devices_platforms.md
echo "| 22   | Alpha<br>Networks | BES2348T        	| Broadcom    | Trident 3 X2         | 48x1G+4x25G                 | [SONiC-ONIE-Broadcom]($(echo "${ARTF_BRCM}" | sed 's/format=zip/format=file\&subpath=\/target\/sonic-broadcom.bin/')) |" >> supported_devices_platforms.md
echo "| 23   | Arista        | 7050QX-32      		| Broadcom    | Trident 2         | 32x40G                  | [SONiC-Aboot-Broadcom]($(echo "${ARTF_BFT}" | sed 's/format=zip/format=file\&subpath=\/target\/sonic-aboot-barefoot.swi/')) |" >> supported_devices_platforms.md
echo "| 24   | Arista        | 7050QX-32S     		| Broadcom    | Trident 2         | 32x40G                  | [SONiC-Aboot-Broadcom]($(echo "${ARTF_BFT}" | sed 's/format=zip/format=file\&subpath=\/target\/sonic-aboot-barefoot.swi/')) |" >> supported_devices_platforms.md
echo "| 25   | Arista        | 7050CX3-32S     		| Broadcom    | Trident 3         | 32x100G + 2x10G         | [SONiC-Aboot-Broadcom]($(echo "${ARTF_BFT}" | sed 's/format=zip/format=file\&subpath=\/target\/sonic-aboot-barefoot.swi/')) |" >> supported_devices_platforms.md
echo "| 26   | Arista        | 7060CX-32S     		| Broadcom    | Tomahawk          | 32x100G + 2x10G         | [SONiC-Aboot-Broadcom]($(echo "${ARTF_BFT}" | sed 's/format=zip/format=file\&subpath=\/target\/sonic-aboot-barefoot.swi/')) |" >> supported_devices_platforms.md
echo "| 27   | Arista        | 7060DX4-32       		| Broadcom    | Tomahawk 3        | 32x400G + 2x10G         | [SONiC-Aboot-Broadcom]($(echo "${ARTF_BFT}" | sed 's/format=zip/format=file\&subpath=\/target\/sonic-aboot-barefoot.swi/')) |" >> supported_devices_platforms.md
echo "| 28   | Arista        | 7060PX4-32       		| Broadcom    | Tomahawk 3        | 32x400G + 2x10G         | [SONiC-Aboot-Broadcom]($(echo "${ARTF_BFT}" | sed 's/format=zip/format=file\&subpath=\/target\/sonic-aboot-barefoot.swi/')) |" >> supported_devices_platforms.md
echo "| 29   | Arista        | 7170-32CD       		| Intel    | Tofino            | 32x100G + 2x10G         | [SONiC-Aboot-Barefoot]($(echo "${ARTF_BFT}" | sed 's/format=zip/format=file\&subpath=\/target\/sonic-aboot-barefoot.swi/')) |" >> supported_devices_platforms.md
echo "| 30   | Arista        | 7170-64C       		| Intel    | Tofino            | 64x100G + 2x10G         | [SONiC-Aboot-Barefoot]($(echo "${ARTF_BFT}" | sed 's/format=zip/format=file\&subpath=\/target\/sonic-aboot-barefoot.swi/')) |" >> supported_devices_platforms.md
echo "| 31   | Arista        | 7260CX3-64     		| Broadcom    | Tomahawk 2        | 64x100G + 2x10G         | [SONiC-Aboot-Broadcom]($(echo "${ARTF_BFT}" | sed 's/format=zip/format=file\&subpath=\/target\/sonic-aboot-barefoot.swi/')) |" >> supported_devices_platforms.md
echo "| 32   | Arista        | 7280CR3-32D4   		| Broadcom    | Jericho 2         | 32x100G + 4x400G        | [SONiC-Aboot-Broadcom]($(echo "${ARTF_BFT}" | sed 's/format=zip/format=file\&subpath=\/target\/sonic-aboot-barefoot.swi/')) |" >> supported_devices_platforms.md
echo "| 33   | Arista        | 7280CR3-32P4   		| Broadcom    | Jericho 2         | 32x100G + 4x400G        | [SONiC-Aboot-Broadcom]($(echo "${ARTF_BFT}" | sed 's/format=zip/format=file\&subpath=\/target\/sonic-aboot-barefoot.swi/')) |" >> supported_devices_platforms.md
echo "| 34   | Accton      | Wedge 100BF-32 		| Intel    | Tofino            | 32x100G                 | [SONiC-ONIE-Barefoot]($(echo "${ARTF_BFT}" | sed 's/format=zip/format=file\&subpath=\/target\/sonic-barefoot.bin/')) |" >> supported_devices_platforms.md
echo "| 35   | Accton      | Wedge 100BF-65X		| Intel    | Tofino            | 32x100G                 | [SONiC-ONIE-Barefoot]($(echo "${ARTF_BFT}" | sed 's/format=zip/format=file\&subpath=\/target\/sonic-barefoot.bin/')) |" >> supported_devices_platforms.md
echo "| 36   | Celestica 	| DX010          		| Broadcom    | Tomahawk          | 32x100G                 | [SONiC-ONIE-Broadcom]($(echo "${ARTF_BRCM}" | sed 's/format=zip/format=file\&subpath=\/target\/sonic-broadcom.bin/')) |" >> supported_devices_platforms.md
echo "| 37   | Celestica 	| E1031          		| Broadcom    | Helix4            | 48x1G   + 4x10G         | [SONiC-ONIE-Broadcom]($(echo "${ARTF_BRCM}" | sed 's/format=zip/format=file\&subpath=\/target\/sonic-broadcom.bin/')) |" >> supported_devices_platforms.md
echo "| 38   | Celestica 	| midstone-200i  		| Marvell    | Teralynx 7        | 128x100G                |[SONiC-ONIE-Innovium]($(echo "${ARTF_INNO}" | sed 's/format=zip/format=file\&subpath=\/target\/sonic-innovium-dbg.bin/')) |" >> supported_devices_platforms.md
echo "| 39   | Celestica     | Silverstone     		| Broadcom    | Tomahawk 3        | 32x400G                 | [SONiC-ONIE-Broadcom]($(echo "${ARTF_BRCM}" | sed 's/format=zip/format=file\&subpath=\/target\/sonic-broadcom.bin/')) |" >> supported_devices_platforms.md
echo "| 40   | Celestica     | Seastone_2     		| Broadcom    | Trident 3        | 32x100G                 | [SONiC-ONIE-Broadcom]($(echo "${ARTF_BRCM}" | sed 's/format=zip/format=file\&subpath=\/target\/sonic-broadcom.bin/')) |" >> supported_devices_platforms.md
echo "| 41   | Centec    	| E582-48X2Q     		| Centec      | Goldengate        | 48x10G + 2x40G + 4x100G | [SONiC-ONIE-Centec]($(echo "${ARTF_CTC}" | sed 's/format=zip/format=file\&subpath=\/target\/sonic-centec.bin/')) |" >> supported_devices_platforms.md
echo "| 42   | Centec    	| E582-48X6Q     		| Centec      | Goldengate        | 48x10G + 6x40G          | [SONiC-ONIE-Centec]($(echo "${ARTF_CTC}" | sed 's/format=zip/format=file\&subpath=\/target\/sonic-centec.bin/')) |" >> supported_devices_platforms.md
echo "| 43   | Cig       	| CS6436-56P     		| Nephos      | NP8366       | 48x25G + 8x100G         | [SONiC-ONIE-Nephos]($(echo "${ARTF_NPH}" | sed 's/format=zip/format=file\&subpath=\/target\/sonic-nephos.bin/')) |" >> supported_devices_platforms.md
echo "| 44   | Cig | CS5435-54P | Nephos | NP8363 | 10GX48,100GX6 | [SONiC-ONIE-Nephos]($(echo "${ARTF_NPH}" | sed 's/format=zip/format=file\&subpath=\/target\/sonic-nephos.bin/')) |" >> supported_devices_platforms.md
echo "| 45   | Cig | CS6436-54P | Nephos | NP8365 | 25GX48,100GX6 | [SONiC-ONIE-Nephos]($(echo "${ARTF_NPH}" | sed 's/format=zip/format=file\&subpath=\/target\/sonic-nephos.bin/')) |" >> supported_devices_platforms.md
echo "| 46   | Dell |	N3248PXE |	Broadcom  |	Trident 3.X5 |	48x10GCU+4x25G-2x100G |	[SONiC-ONIE-Broadcom]($(echo "${ARTF_BRCM}" | sed 's/format=zip/format=file\&subpath=\/target\/sonic-broadcom.bin/')) |" >> supported_devices_platforms.md
echo "| 47   | Dell |	N3248TE  |	Broadcom  |	Trident 3.X3   |	48x1G+4x10G-2x100G | [SONiC-ONIE-Broadcom]($(echo "${ARTF_BRCM}" | sed 's/format=zip/format=file\&subpath=\/target\/sonic-broadcom.bin/')) |" >> supported_devices_platforms.md
echo "| 48   | Dell |	S5212F 	| Broadcom 	| Trident 3.X5  |	12x25G+3x100G |	[SONiC-ONIE-Broadcom]($(echo "${ARTF_BRCM}" | sed 's/format=zip/format=file\&subpath=\/target\/sonic-broadcom.bin/')) |" >> supported_devices_platforms.md
echo "| 49   | Dell |	S5224F 	| Broadcom 	| Trident 3.X5  |	24x25G+4x100G |	[SONiC-ONIE-Broadcom]($(echo "${ARTF_BRCM}" | sed 's/format=zip/format=file\&subpath=\/target\/sonic-broadcom.bin/')) |" >> supported_devices_platforms.md
echo "| 50   | Dell          | S5232F-ON     		| Broadcom    | Trident 3         | 32x100G                 | [SONiC-ONIE-Broadcom]($(echo "${ARTF_BRCM}" | sed 's/format=zip/format=file\&subpath=\/target\/sonic-broadcom.bin/')) |" >> supported_devices_platforms.md
echo "| 51   | Dell          | S5248F-ON     		| Broadcom    | Trident 3-2T      | 48x25G,4x100G,2x200G   | [SONiC-ONIE-Broadcom]($(echo "${ARTF_BRCM}" | sed 's/format=zip/format=file\&subpath=\/target\/sonic-broadcom.bin/')) |" >> supported_devices_platforms.md
echo "| 52   | Dell		   | s5296F				| Broadcom	  | Trident 3		  | 96x25G				   | [SONiC-ONIE-Broadcom]($(echo "${ARTF_BRCM}" | sed 's/format=zip/format=file\&subpath=\/target\/sonic-broadcom.bin/')) |" >> supported_devices_platforms.md
echo "| 53   | Dell          | S6000-ON       		| Broadcom    | Trident 2         | 32x40G                  | [SONiC-ONIE-Broadcom]($(echo "${ARTF_BRCM}" | sed 's/format=zip/format=file\&subpath=\/target\/sonic-broadcom.bin/')) |" >> supported_devices_platforms.md
echo "| 54   | Dell          | S6100-ON       		| Broadcom    | Tomahawk          | 64x40G                  | [SONiC-ONIE-Broadcom]($(echo "${ARTF_BRCM}" | sed 's/format=zip/format=file\&subpath=\/target\/sonic-broadcom.bin/')) |" >> supported_devices_platforms.md
echo "| 55   | Dell          | Z9100-ON      		| Broadcom    | Tomahawk          | 32x100G                 | [SONiC-ONIE-Broadcom]($(echo "${ARTF_BRCM}" | sed 's/format=zip/format=file\&subpath=\/target\/sonic-broadcom.bin/')) |" >> supported_devices_platforms.md
echo "| 56   | Dell          | Z9264F-ON          		| Broadcom    | Tomahawk 2        | 64x100G                 | [SONiC-ONIE-Broadcom]($(echo "${ARTF_BRCM}" | sed 's/format=zip/format=file\&subpath=\/target\/sonic-broadcom.bin/')) |" >> supported_devices_platforms.md
echo "| 57   | Dell          | Z9332F-ON     		| Broadcom    | Tomahawk 3        | 32x400G,2x10G           | [SONiC-ONIE-Broadcom]($(echo "${ARTF_BRCM}" | sed 's/format=zip/format=file\&subpath=\/target\/sonic-broadcom.bin/')) |" >> supported_devices_platforms.md
echo "| 58   | Dell          | Z9332f-C32    		| Broadcom    | Tomahawk 3        | 32x100G           | [SONiC-ONIE-Broadcom]($(echo "${ARTF_BRCM}" | sed 's/format=zip/format=file\&subpath=\/target\/sonic-broadcom.bin/')) |" >> supported_devices_platforms.md
echo "| 59   | Delta     	| AG5648         		| Broadcom    | Tomahawk          | 48x25G + 6x100G         | [SONiC-ONIE-Broadcom]($(echo "${ARTF_BRCM}" | sed 's/format=zip/format=file\&subpath=\/target\/sonic-broadcom.bin/')) |" >> supported_devices_platforms.md
echo "| 60   | Delta     	| AG9032V1       		| Broadcom    | Tomahawk          | 32x100G                 | [SONiC-ONIE-Broadcom]($(echo "${ARTF_BRCM}" | sed 's/format=zip/format=file\&subpath=\/target\/sonic-broadcom.bin/')) |" >> supported_devices_platforms.md
echo "| 61   | Delta     	| AG9032V2A       		| Broadcom    | Trident 3         | 32x100G + 1x10G         | [SONiC-ONIE-Broadcom]($(echo "${ARTF_BRCM}" | sed 's/format=zip/format=file\&subpath=\/target\/sonic-broadcom.bin/')) |" >> supported_devices_platforms.md
echo "| 62   | Delta     	| AG9064         		| Broadcom    | Tomahawk 2        | 64x100G                 | [SONiC-ONIE-Broadcom]($(echo "${ARTF_BRCM}" | sed 's/format=zip/format=file\&subpath=\/target\/sonic-broadcom.bin/')) |" >> supported_devices_platforms.md
echo "| 63   | Delta     	| et-c032if      		| Marvell    | Teralynx 7        | 32x400G                 |[SONiC-ONIE-Innovium]($(echo "${ARTF_INNO}" | sed 's/format=zip/format=file\&subpath=\/target\/sonic-innovium-dbg.bin/')) |" >> supported_devices_platforms.md
echo "| 64   | Delta     	| ET-6448M      		| Marvell     | Prestera 98DX3255 | 48xGE + 4x10G           | [SONiC-ONIE-Marvell]($(echo "${ARTF_MRV}" | sed 's/format=zip/format=file\&subpath=\/target\/sonic-marvell-armhf.bin/')) |" >> supported_devices_platforms.md
echo "| 65   | Delta     	| agc032      			| Broadcom     | Tomahawk3		  | 32x400G + 2x10G         | [SONiC-ONIE-Marvell]($(echo "${ARTF_MRV}" | sed 's/format=zip/format=file\&subpath=\/target\/sonic-marvell-armhf.bin/')) |" >> supported_devices_platforms.md
echo "| 66   | Embedway  	| ES6220 (48x10G)		| Centec      | Goldengate        | 48x10G + 2x40G + 4x100G | [SONiC-ONIE-Centec]($(echo "${ARTF_CTC}" | sed 's/format=zip/format=file\&subpath=\/target\/sonic-centec.bin/')) |" >> supported_devices_platforms.md
echo "| 67   | Embedway  	| ES6428A-X48Q2H4		| Centec      | Goldengate        | 4x100G + 2x40G + 48x10G | [SONiC-ONIE-Centec]($(echo "${ARTF_CTC}" | sed 's/format=zip/format=file\&subpath=\/target\/sonic-centec.bin/')) |" >> supported_devices_platforms.md
echo "| 68   | Facebook      | Wedge 100-32X  		| Broadcom    | Tomahawk          | 32x100G                 | [SONiC-ONIE-Broadcom]($(echo "${ARTF_BRCM}" | sed 's/format=zip/format=file\&subpath=\/target\/sonic-broadcom.bin/')) |" >> supported_devices_platforms.md
echo "| 69   | Ingrasys      | S8810-32Q      		| Broadcom    | Trident 2         | 32x40G                  | [SONiC-ONIE-Broadcom]($(echo "${ARTF_BRCM}" | sed 's/format=zip/format=file\&subpath=\/target\/sonic-broadcom.bin/')) |" >> supported_devices_platforms.md
echo "| 70   | Ingrasys      | S8900-54XC     		| Broadcom    | Tomahawk          | 48x25G + 6x100G         | [SONiC-ONIE-Broadcom]($(echo "${ARTF_BRCM}" | sed 's/format=zip/format=file\&subpath=\/target\/sonic-broadcom.bin/')) |" >> supported_devices_platforms.md
echo "| 71   | Ingrasys      | S8900-64XC     		| Broadcom    | Tomahawk          | 48x25G + 16x100G        | [SONiC-ONIE-Broadcom]($(echo "${ARTF_BRCM}" | sed 's/format=zip/format=file\&subpath=\/target\/sonic-broadcom.bin/')) |" >> supported_devices_platforms.md
echo "| 72   | Ingrasys      | S9100-32X      		| Broadcom    | Tomahawk          | 32x100G                 | [SONiC-ONIE-Broadcom]($(echo "${ARTF_BRCM}" | sed 's/format=zip/format=file\&subpath=\/target\/sonic-broadcom.bin/')) |" >> supported_devices_platforms.md
echo "| 73   | Ingrasys      | S9130-32X      		| Nephos      | Taurus            | 32x100G                 | [SONiC-ONIE-Nephos]($(echo "${ARTF_NPH}" | sed 's/format=zip/format=file\&subpath=\/target\/sonic-nephos.bin/')) |" >> supported_devices_platforms.md
echo "| 74   | Ingrasys      | S9180-32X      		| Intel    | Tofino            | 32x100G                 | [SONiC-ONIE-Barefoot]($(echo "${ARTF_BFT}" | sed 's/format=zip/format=file\&subpath=\/target\/sonic-barefoot.bin/')) |" >> supported_devices_platforms.md
echo "| 75   | Ingrasys      | S9200-64X      		| Broadcom    | Tomahawk 2        | 64x100G                 | [SONiC-ONIE-Broadcom]($(echo "${ARTF_BRCM}" | sed 's/format=zip/format=file\&subpath=\/target\/sonic-broadcom.bin/')) |" >> supported_devices_platforms.md
echo "| 76   | Ingrasys      | S9230-64X      		| Nephos      | Taurus            | 64x100G                 | [SONiC-ONIE-Nephos]($(echo "${ARTF_NPH}" | sed 's/format=zip/format=file\&subpath=\/target\/sonic-nephos.bin/')) |" >> supported_devices_platforms.md
echo "| 77   | Ingrasys      | S9280-64X      		| Intel    | Tofino            | 64x100G                 | [SONiC-ONIE-Barefoot]($(echo "${ARTF_BFT}" | sed 's/format=zip/format=file\&subpath=\/target\/sonic-barefoot.bin/')) |" >> supported_devices_platforms.md
echo "| 78   | Inventec  	| D6254QS        		| Broadcom    | Trident 2         | 72x10G                  | [SONiC-ONIE-Broadcom]($(echo "${ARTF_BRCM}" | sed 's/format=zip/format=file\&subpath=\/target\/sonic-broadcom.bin/')) |" >> supported_devices_platforms.md
echo "| 79   | Inventec  	| D6356          		| Broadcom    | Trident 3         | 48x25G + 8x100G         | [SONiC-ONIE-Broadcom]($(echo "${ARTF_BRCM}" | sed 's/format=zip/format=file\&subpath=\/target\/sonic-broadcom.bin/')) |" >> supported_devices_platforms.md
echo "| 80   | Inventec  	| D6556          		| Broadcom    | Trident 3         | 48x25G + 8x100G         | [SONiC-ONIE-Broadcom]($(echo "${ARTF_BRCM}" | sed 's/format=zip/format=file\&subpath=\/target\/sonic-broadcom.bin/')) |" >> supported_devices_platforms.md
echo "| 81   | Inventec  	| D7032Q         		| Broadcom    | Tomahawk          | 32x100G                 | [SONiC-ONIE-Broadcom]($(echo "${ARTF_BRCM}" | sed 's/format=zip/format=file\&subpath=\/target\/sonic-broadcom.bin/')) |" >> supported_devices_platforms.md
echo "| 82   | Inventec  	| D7054Q         		| Broadcom    | Tomahawk          | 48x25G + 6x100G         | [SONiC-ONIE-Broadcom]($(echo "${ARTF_BRCM}" | sed 's/format=zip/format=file\&subpath=\/target\/sonic-broadcom.bin/')) |" >> supported_devices_platforms.md
echo "| 83   | Inventec  	| D7264Q         		| Broadcom    | Tomahawk 2        | 64x100G                 | [SONiC-ONIE-Broadcom]($(echo "${ARTF_BRCM}" | sed 's/format=zip/format=file\&subpath=\/target\/sonic-broadcom.bin/')) |" >> supported_devices_platforms.md
echo "| 84   | Juniper Networks| QFX5210-64C    		| Broadcom    | Tomahawk 2        | 64x100G                 | [SONiC-ONIE-Broadcom]($(echo "${ARTF_BRCM}" | sed 's/format=zip/format=file\&subpath=\/target\/sonic-broadcom.bin/')) |" >> supported_devices_platforms.md
echo "| 85   | Juniper Networks| QFX5200-32C-S    		| Broadcom    | Tomahawk 1        | 32x100G                 | [SONiC-ONIE-Broadcom]($(echo "${ARTF_BRCM}" | sed 's/format=zip/format=file\&subpath=\/target\/sonic-broadcom.bin/')) |" >> supported_devices_platforms.md
echo "| 86   | Marvell       | RD-ARM-48XG6CG-A4  	| Marvell     | Prestera 98EX54xx | 6x100G+48x10G           | [SONiC-ONIE-Marvell]($(echo "${ARTF_MRV}" | sed 's/format=zip/format=file\&subpath=\/target\/sonic-marvell-armhf.bin/')) |" >> supported_devices_platforms.md
echo "| 87   | Marvell       | RD-BC3-4825G6CG-A4 	| Marvell     | Prestera 98CX84xx | 6x100G+48x25G           | [SONiC-ONIE-Marvell]($(echo "${ARTF_MRV}" | sed 's/format=zip/format=file\&subpath=\/target\/sonic-marvell-armhf.bin/')) |" >> supported_devices_platforms.md
echo "| 88   | Marvell       | 98cx8580			 	| Marvell     | Prestera CX		  | 32x400G + 16x400G       | [SONiC-ONIE-Marvell]($(echo "${ARTF_MRV}" | sed 's/format=zip/format=file\&subpath=\/target\/sonic-marvell-armhf.bin/')) |" >> supported_devices_platforms.md
echo "| 89   | Nvidia        | SN2010            	| Nvidia | Spectrum          | 18x25G + 4x100G         | [SONiC-ONIE-Mellanox]($(echo "${ARTF_MLNX}" | sed 's/format=zip/format=file\&subpath=\/target\/sonic-mellanox.bin/')) |" >> supported_devices_platforms.md
echo "| 90   | Nvidia        | SN2100         	| Nvidia | Spectrum          | 16x100G                 | [SONiC-ONIE-Mellanox]($(echo "${ARTF_MLNX}" | sed 's/format=zip/format=file\&subpath=\/target\/sonic-mellanox.bin/')) |" >> supported_devices_platforms.md
echo "| 91   | Nvidia        | SN2410         	| Nvidia | Spectrum          | 48x25G + 8x100G         | [SONiC-ONIE-Mellanox]($(echo "${ARTF_MLNX}" | sed 's/format=zip/format=file\&subpath=\/target\/sonic-mellanox.bin/')) |" >> supported_devices_platforms.md
echo "| 92   | Nvidia        | SN2700         	| Nvidia | Spectrum          | 32x100G                 | [SONiC-ONIE-Mellanox]($(echo "${ARTF_MLNX}" | sed 's/format=zip/format=file\&subpath=\/target\/sonic-mellanox.bin/')) |" >> supported_devices_platforms.md
echo "| 93   | Nvidia        | SN3420         	| Nvidia | Spectrum 2        | 48x25G + 12x100G        | [SONiC-ONIE-Mellanox]($(echo "${ARTF_MLNX}" | sed 's/format=zip/format=file\&subpath=\/target\/sonic-mellanox.bin/')) |" >> supported_devices_platforms.md
echo "| 94   | Nvidia        | SN3700         	| Nvidia | Spectrum 2        | 32x200G                 | [SONiC-ONIE-Mellanox]($(echo "${ARTF_MLNX}" | sed 's/format=zip/format=file\&subpath=\/target\/sonic-mellanox.bin/')) |" >> supported_devices_platforms.md
echo "| 95   | Nvidia        | SN3700C        	| Nvidia | Spectrum 2        | 32x100G                 | [SONiC-ONIE-Mellanox]($(echo "${ARTF_MLNX}" | sed 's/format=zip/format=file\&subpath=\/target\/sonic-mellanox.bin/')) |" >> supported_devices_platforms.md
echo "| 96   | Nvidia        | SN3800         	| Nvidia | Spectrum 2        | 64x100G                 | [SONiC-ONIE-Mellanox]($(echo "${ARTF_MLNX}" | sed 's/format=zip/format=file\&subpath=\/target\/sonic-mellanox.bin/')) |" >> supported_devices_platforms.md
echo "| 97   | Nvidia        | SN4600C        	| Nvidia | Spectrum 3        | 64x100G                 | [SONiC-ONIE-Mellanox]($(echo "${ARTF_MLNX}" | sed 's/format=zip/format=file\&subpath=\/target\/sonic-mellanox.bin/')) |" >> supported_devices_platforms.md
echo "| 98   | Nvidia        | SN4700         	| Nvidia | Spectrum 3        | 32x400G                 | [SONiC-ONIE-Mellanox]($(echo "${ARTF_MLNX}" | sed 's/format=zip/format=file\&subpath=\/target\/sonic-mellanox.bin/')) |" >> supported_devices_platforms.md
echo "| 99   | Mitac         | LY1200-B32H0-C3		| Broadcom    | Tomahawk          | 32x100G                 | [SONiC-ONIE-Broadcom]($(echo "${ARTF_BRCM}" | sed 's/format=zip/format=file\&subpath=\/target\/sonic-broadcom.bin/')) |" >> supported_devices_platforms.md
echo "| 100   | Pegatron      | Porsche         		| Nephos      | Taurus            | 48x25G + 6x100G         | [SONiC-ONIE-Nephos]($(echo "${ARTF_NPH}" | sed 's/format=zip/format=file\&subpath=\/target\/sonic-nephos.bin/')) |" >> supported_devices_platforms.md
echo "| 101   | Quanta        | T3032-IX7      		| Broadcom    | Trident 3         | 32x100G                 | [SONiC-ONIE-Broadcom]($(echo "${ARTF_BRCM}" | sed 's/format=zip/format=file\&subpath=\/target\/sonic-broadcom.bin/')) |" >> supported_devices_platforms.md
echo "| 102   | Quanta        | T4048-IX8      		| Broadcom    | Trident 3         | 48x25G + 8x100G         | [SONiC-ONIE-Broadcom]($(echo "${ARTF_BRCM}" | sed 's/format=zip/format=file\&subpath=\/target\/sonic-broadcom.bin/')) |" >> supported_devices_platforms.md
echo "| 103   | Quanta        | T4048-IX8C     		| Broadcom    | Trident 3         | 48x25G + 8x100G         | [SONiC-ONIE-Broadcom]($(echo "${ARTF_BRCM}" | sed 's/format=zip/format=file\&subpath=\/target\/sonic-broadcom.bin/')) |" >> supported_devices_platforms.md
echo "| 104   | Quanta        | T7032-IX1B     		| Broadcom    | Tomahawk          | 32x100G                 | [SONiC-ONIE-Broadcom]($(echo "${ARTF_BRCM}" | sed 's/format=zip/format=file\&subpath=\/target\/sonic-broadcom.bin/')) |" >> supported_devices_platforms.md
echo "| 105   | Quanta        | T9032-IX9      		| Broadcom    | Tomahawk 3        | 32x400G                 | [SONiC-ONIE-Broadcom]($(echo "${ARTF_BRCM}" | sed 's/format=zip/format=file\&subpath=\/target\/sonic-broadcom.bin/')) |" >> supported_devices_platforms.md
echo "| 106   | Wistron 	| sw-to3200k  		| Marvell    | Teralynx 7        | 32x400G              |[SONiC-ONIE-Innovium]($(echo "${ARTF_INNO}" | sed 's/format=zip/format=file\&subpath=\/target\/sonic-innovium-dbg.bin/')) |" >> supported_devices_platforms.md
echo "| 107   | Wistron 	| 6512-32r  		| Marvell    | Teralynx 7        | 32x400G              |[SONiC-ONIE-Innovium]($(echo "${ARTF_INNO}" | sed 's/format=zip/format=file\&subpath=\/target\/sonic-innovium-dbg.bin/')) |" >> supported_devices_platforms.md
echo "| 108   | Wnc           | OSW1800        		| Intel    | Tofino            | 48x25G + 6x100G         | [SONiC-ONIE-Barefoot]($(echo "${ARTF_BFT}" | sed 's/format=zip/format=file\&subpath=\/target\/sonic-barefoot.bin/')) |" >> supported_devices_platforms.md


	
done

git add supported_devices_platforms.md
git commit -m "latest links for sonic images in supported platform md file"
git push -f --set-upstream origin sonic_image_md_update
