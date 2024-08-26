# MTR Network Analysis Script on macOS

This script is an improved version that integrates three previously separate network monitoring configurations developed during my time at WeWork. It serves as a comprehensive tool for network analysis using MTR (My TraceRoute).:

1. Real-time network view
2. 1000 packet report
3. TCP 443 traffic analysis

## Prerequisites

- MTR installed on your system via the command brew install mtr https://www.exavault.com/docs/mtr
- Sudo privileges

## Usage

1. Clone this repository or download the script.
2. Go to the script directory path and make the script executable:
   ```
   chmod +x mtr_analysis.sh
   ```
3. Run the script:
   ```
   ./mtr_analysis.sh
   ```
4. Choose an option from the menu.

## Features

- **Real-time view**: Continuous updates on network performance to 1.1.1.1 (Cloudflare DNS).
- **1000 packet report**: Comprehensive overview of network performance over 1000 packets to 8.8.8.8 (Google DNS).
- **TCP 443 traffic analysis**: Specific analysis of HTTPS traffic to dns.google.com.

## Output

- Real-time view is displayed in the terminal.
- Reports are saved to your Desktop as text files.

## Customization

You can modify the, MTR version, desired path with your username, target IP addresses, packet counts, or output fields by editing the script.

MTR_PATH="/usr/local/Cellar/mtr/YOUR_DOWNLOADED_VERSION/sbin/mtr"
>> /Users/Your_Computer_Username/Desktop/tcp_mtr_report.txt

![View1](https://github.com/user-attachments/assets/81b4bb19-5096-4b3e-87b2-1aea6a884ea7)

![View 2](https://github.com/user-attachments/assets/22b0777d-92ac-46cb-ac97-6fb6197d5794)

![Case 3 less than 5 mins](https://github.com/user-attachments/assets/1ff83215-8be2-496c-b3f5-ecb2a8ba74be)

![tcp_mtr_report](https://github.com/user-attachments/assets/3142cf9a-5343-4bbf-87f2-02c02574d043)

![Case 4 around 16 mins](https://github.com/user-attachments/assets/17335af7-e070-420e-bc19-3e8d0ddfaa04)

![mtr_report](https://github.com/user-attachments/assets/ebd289fc-1965-4830-96a3-c289f85ce7a7)





