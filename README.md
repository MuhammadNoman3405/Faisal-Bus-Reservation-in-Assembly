# ✈️ Faisal Travel Agency - Ticket Booking System

A console-based **Flight Ticket Booking System** built in **x86 Assembly Language (NASM)**. This low-level project demonstrates direct system calls, memory management, and array manipulation at the assembly level.

---

## 🚀 Features

- **🎫 Book Ticket:** Reserve any of the 20 available seats by entering seat number and passenger name
- **📋 Show Status:** Display all seats with their booking status and passenger names
- **✅ Validation:** Prevents double booking and invalid seat numbers
- **⚡ Low-Level I/O:** Uses Linux system calls directly for input/output

---

## 🛠️ Tech Stack

- **Language:** x86 Assembly (NASM)
- **OS:** Linux
- **Concepts:** System Calls, Memory Segmentation, Array Manipulation, String Operations

---

## 💻 How to Run

1. Install NASM assembler
2. Assemble the program:
```bash
   nasm -f elf32 main.asm -o main.o
```
3. Link the object file:
```bash
   ld -m elf_i386 main.o -o main
```
4. Run:
```bash
   ./main
```

---

## 🌐 Connect & Portfolio

- **Portfolio Website**: [Explore My Projects](https://my-portfolio-website-six-ashen.vercel.app)
- **LinkedIn**: [Connect with Muhammad Noman](https://www.linkedin.com/in/muhammad-noman-a219712b0/)

---

**Developed with ❤️ by Noman**
*BSCS @ UET Taxila | Data Science & ML Enthusiast*
