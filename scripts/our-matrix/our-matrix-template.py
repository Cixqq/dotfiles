import pyperclip

HOME_DIR = "/home/omar/scripts/our-matrix"

def getHtml(iframe): 
    f = open(f"{HOME_DIR}/our-matrix-html-template.html")
    html = f.read()
    return html.replace("{iframe}", iframe)

def saveOldIframe(result):
    f = open(f"{HOME_DIR}/log", "w")
    f.write(result)
    f.close()

if __name__ == "__main__":
    iframe = input("Enter Iframe: ")
    result = getHtml(iframe)
    
    print("-"*30)
    print(result)
    print("-"*30)
    
    pyperclip.copy(result)
    print("Copied to clipboard.")

    saveOldIframe(result)
    print("Saved the result.")
