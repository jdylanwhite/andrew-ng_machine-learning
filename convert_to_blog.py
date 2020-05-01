# Import modules
import os
import sys
import zipfile

# Set directory paths
downloadDir = r'C:\\Users\\J. Dylan White\\Downloads\\'
websiteDir = r'C:\\Users\\J. Dylan White\Documents\\Website\\'

# Get system arguments
if len(sys.argv) != 4:
    print("Proper usage - python conter_to_blog.py 2020-04-01 Lecture 03")
else:
    date = sys.argv[1]
    postType = sys.argv[2]
    weekNumber = sys.argv[3]
    print("Converting post for {1} {2} on date: {0}".format(date,postType,weekNumber))
    
# Unzip python notebook, converted using the Jupyter menu
zippedFile = downloadDir+postType+" "+weekNumber+".zip"
unzippedDir = downloadDir+postType+" "+weekNumber+"\\"
with zipfile.ZipFile(zippedFile, 'r') as zip_ref:
    zip_ref.extractall(unzippedDir)
    
# Arrange the destination files and directories 
imageDir = websiteDir+"images/"+date+"/"
if not os.path.exists(imageDir):
    os.mkdir(imageDir)
postDir = websiteDir+"_posts/"
postFile = date+"-Andrew-Ng-ML-"+postType+"-"+weekNumber+".md"
postPath = postDir+postFile

# Copy markdown file with some modifications
inF = open(unzippedDir+postType+" "+weekNumber+".md","r")
outF = open(postPath,"w")
for line in inF.readlines():
    if line.startswith("# Week"):
        title = "Week "+str(int(weekNumber))+" "+postType+", "+line.split(" - ")[1].rstrip()
        outF.write("---\n")
        outF.write("layout: posts\n")
        outF.write("title: "+title+"\n")
        outF.write("category: andrew-ng_machine-learning\n")
        outF.write("---\n")
    elif "![png]" in line:
        lineFile = line.split("](")[1].split(")")[0]
        line = line.replace(lineFile,"/images/"+date+"/"+lineFile)
        line = line.rstrip()+r"""{:width="80%"}"""
        outF.write(line+"\n")
    else:
        outF.write(line)
inF.close()
outF.close()
os.remove(unzippedDir+postType+" "+weekNumber+".md")

# Move the images
for image in os.listdir(unzippedDir):
    os.rename(unzippedDir+image,imageDir+image)
    
    