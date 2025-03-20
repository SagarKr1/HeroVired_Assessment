# Create a Python program that reads a text file and prints the number of lines,
# words, and characters in it.

filename = "text.txt"

try:
    with open(filename, 'r', encoding='utf-8') as file:
        FileContent = file.read() 
        
        lines = FileContent.count('\n') + 1
        words = len(FileContent.split())
        chars = len(FileContent)
        
        print("Number of lines : ",lines)
        print("Number of Words : ",words)
        print("Number of Characters : ",chars)

except FileNotFoundError:
    print(FileNotFoundError)
