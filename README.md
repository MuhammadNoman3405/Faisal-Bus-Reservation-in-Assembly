# 🚌 Faisal Bus Reservation System (x86 Assembly)

A low-level bus ticket management system written in **x86 Assembly Language** (Intel Syntax) for Linux. This project demonstrates high-performance programming, direct system calls, and manual memory management.

---

## 📊 Low-Level Technical Highlights

- **Direct System Calls**: Utilizes Linux kernel interrupts (`int 0x80`) for standard input/output (`sys_read`, `sys_write`) and program termination.
- **Manual Memory Mapping**: Implements custom logic to manage a 2D-like data structure for passenger names using offset calculation: `index * NAME_LEN`.
- **ASCII Arithmetic**: Includes custom routines for converting ASCII inputs to integers and vice versa to facilitate seat selection and status display.
- **Register Optimization**: Strategic use of registers (`ESI`, `EDI`, `EAX`, `EBX`) to maintain fast loop execution and data pointers.



---

## 🌟 Features

- **🎫 Ticket Booking**: Real-time seat allocation for 20 unique slots.
- **📋 Status Dashboard**: Displays a comprehensive table showing Seat Number, Booking Status (Available/Booked), and Passenger Name.
- **⚠️ Input Validation**: Checks for valid seat ranges (1-20) and prevents double-booking using conditional jumps.
- **⚡ Zero Dependency**: Runs directly on the CPU instruction level without the overhead of high-level language runtimes.

---

## 🛠️ Installation & Execution (Linux)

To run this project, you will need the **NASM** (Netwide Assembler) and **ld** (Linker).

1. **Assemble the code:**
   ```bash
   nasm -f elf32 main.asm -o main.o

```

2. **Link the object file:**
```bash
ld -m elf_i386 main.o -o bus_reservation

```


3. **Run the executable:**
```bash
./bus_reservation

```



---

## 🔗 Connect & Portfolio

* **Portfolio Website:** [Explore My Projects](https://my-portfolio-website-six-ashen.vercel.app)
* **LinkedIn:** [Connect with Muhammad Noman](https://www.linkedin.com/in/muhammad-noman-a219712b0/)

---

**Developed with 💻 by Noman** *BSCS @ UET Taxila | Low-Level Programming Enthusiast*

```

Here is the updated **Consolidated Projects Table**, including your new Assembly project and your clean links. You can copy this entire block directly into your **GitHub Profile README** or your **Portfolio site**.

### **🚀 My Technical Projects**

| Project Name | Description | Tech Stack | Repository Link |
| --- | --- | --- | --- |
| **🛡️ Ai-Job-Guardian** | ML model (NLP) to detect fraudulent job postings with high precision. | Python, Scikit-learn, Streamlit | [View Repo](https://github.com/MuhammadNoman3405/Ai-Job-Guardian) |
| **🚌 Assembly Bus System** | Low-level ticket reservation system using **x86 Assembly** and Linux Syscalls. | Assembly (x86), NASM | [View Repo](https://github.com/MuhammadNoman3405/Faisal-Bus-Reservation-in-Assembly) |
| **✈️ Travel Management** | C++ CLI system for flight bookings using **Doubly Linked Lists**. | C++, DSA (DLL), File Handling | [View Repo](https://github.com/MuhammadNoman3405/DSA-Project-In-C-) |
| **🏦 Bank Management** | A CLI system for managing banking transactions, accounts, and user data. | C++, Structs, Arrays | [View Repo](https://github.com/MuhammadNoman3405/Bank-Management-System-In-C-) |
| **🍎 Fruit & Age App** | Interactive Streamlit dashboard with **live currency conversion**. | Python, Pandas, Streamlit | [View Repo](https://github.com/MuhammadNoman3405/Streamlit) |

---

### **🔗 Connect with Me**

* **Portfolio Website:** [Explore My Projects](https://my-portfolio-website-six-ashen.vercel.app)
* **LinkedIn:** [Muhammad Noman](https://www.linkedin.com/in/muhammad-noman-a219712b0/)

---

### **🎓 Academic Excellence**

* **University:** BS Computer Science, **UET Taxila** (5th Semester)
* **Academic Record:** **4.0/4.0 SGPA**
* **Interests:** Data Science, Machine Learning, Low-level Programming, and Algorithms.

---


