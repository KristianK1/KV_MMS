clc
folders = ["f1", "f22", "f31"];
initialPath ="D:\KV_MMS\voices_repo\testData_easyNames";
result = readFilePaths(initialPath, folders, "mp3")

sizeArray = size(result);
sizeArray = sizeArray(1,1);
for i=1:sizeArray
    result(i);
end
