"""
Date: September 21, 2025
Description:
This program works with a list of IP addresses. It identifies which IPs
are private, counts public IPs, sorts/reverses the private list, checks
for overly long IP addresses, and removes a specific IP if it exists.
"""

# Starting list of IP addresses
ip_addresses = [
    "192.168.1.1",
    "10.0.0.5",
    "172.16.0.1",
    "8.8.8.8",
    "172.32.0.1",
    "255.255.255.255"
]

# Task 1: Identify Private IPs
private_ips = []

# For readability, assign each IP to a variable
ip1, ip2, ip3, ip4, ip5, ip6 = ip_addresses

# Functionality repeated with simple if checks
if ip1.startswith("10.") or ip1.startswith("192.168.") or (ip1.startswith("172.") and 16 <= int(ip1.split(".")[1]) <= 31):
    private_ips.append(ip1)

if ip2.startswith("10.") or ip2.startswith("192.168.") or (ip2.startswith("172.") and 16 <= int(ip2.split(".")[1]) <= 31):
    private_ips.append(ip2)

if ip3.startswith("10.") or ip3.startswith("192.168.") or (ip3.startswith("172.") and 16 <= int(ip3.split(".")[1]) <= 31):
    private_ips.append(ip3)

if ip4.startswith("10.") or ip4.startswith("192.168.") or (ip4.startswith("172.") and 16 <= int(ip4.split(".")[1]) <= 31):
    private_ips.append(ip4)

if ip5.startswith("10.") or ip5.startswith("192.168.") or (ip5.startswith("172.") and 16 <= int(ip5.split(".")[1]) <= 31):
    private_ips.append(ip5)

if ip6.startswith("10.") or ip6.startswith("192.168.") or (ip6.startswith("172.") and 16 <= int(ip6.split(".")[1]) <= 31):
    private_ips.append(ip6)

print("Private IPs:", private_ips)

# Task 2: Count Public IPs
public_count = 0
if ip1 not in private_ips: public_count += 1
if ip2 not in private_ips: public_count += 1
if ip3 not in private_ips: public_count += 1
if ip4 not in private_ips: public_count += 1
if ip5 not in private_ips: public_count += 1
if ip6 not in private_ips: public_count += 1

print("Number of Public IPs:", public_count)

# Task 3: Sort and Reverse
private_ips.sort()
private_ips.reverse()
print("Sorted and Reversed Private IPs:", private_ips)

# Task 4: Length Check (no loops, just check each)
if len(ip1) > 15: print(ip1, "is longer than 15 characters")
if len(ip2) > 15: print(ip2, "is longer than 15 characters")
if len(ip3) > 15: print(ip3, "is longer than 15 characters")
if len(ip4) > 15: print(ip4, "is longer than 15 characters")
if len(ip5) > 15: print(ip5, "is longer than 15 characters")
if len(ip6) > 15: print(ip6, "is longer than 15 characters")

# Task 5: Remove an IP Address
if "255.255.255.255" in ip_addresses:
    idx = ip_addresses.index("255.255.255.255")
    ip_addresses.remove("255.255.255.255")
    print("'255.255.255.255' was found at index", idx, "and removed.")

print("Final IP Addresses List:", ip_addresses)
