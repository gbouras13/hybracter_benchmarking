"""
Function for parsing the 'Reads' config and identifying samples and read files
"""


def simulate_from_csv(csvFile):
    """
    Read samples and files from CSV 
    2 cols
    1 = sample 
    2 = lengths
    """
    outDict = {}
    with open(csvFile,'r') as csv:
        for line in csv:
            l = line.strip().split(',')
            if len(l) == 2:
                outDict[l[0]] = {}
                outDict[l[0]]['chromosome_length'] = l[1]
            else:
                sys.stderr.write("\n"
                                    f"    FATAL: Error parsing {csvFile}.  \n"
                                    "    Check formatting, and that \n" 
                                    "    file names and file paths are correct.\n"
                                    "\n")
                sys.exit(1)
    return outDict



def parseSamplesSimulate(csvfile):
    # for reading from directory
    # if os.path.isdir(readFileDir):
    #   sampleDict = samplesFromDirectory(readFileDir)
    if os.path.isfile(csvfile):
        sampleDict = simulate_from_csv(csvfile)
    else:
        sys.stderr.write("\n"
                         f"    FATAL: {csvfile} is neither a file nor directory.\n"
                         "\n")
        sys.exit(1)
    if len(sampleDict.keys()) == 0:
        sys.stderr.write("\n"
                         "    FATAL: We could not detect any samples at all.\n"
                         "\n")
        sys.exit(1)
    return sampleDict

def real_from_csv(csvFile):
    """
    Read samples and files from CSV 
    5 cols
    1 = sample 
    2 = long reads
    3 = short reads 1
    4 = short reads 2
    5 = chromosome length
    """
    outDict = {}
    with open(csvFile,'r') as csv:
        for line in csv:
            l = line.strip().split(',')
            if len(l) == 5:
                outDict[l[0]] = {}
                if os.path.isfile(l[1]) and os.path.isfile(l[2]) and os.path.isfile(l[3]):
                    outDict[l[0]]['LR'] = l[1]
                    outDict[l[0]]['chromosome_length'] = l[2]
                    outDict[l[0]]['Short_One'] = l[3]
                    outDict[l[0]]['Short_Two'] = l[4]
                else:
                    sys.stderr.write("\n"
                                     f"    FATAL: Error parsing {csvFile}. {l[1]} or {l[3]} or {l[4]} does not exist. \n"
                                     "    Check formatting, and that \n" 
                                     "    file names and file paths are correct.\n"
                                     "\n")
                    sys.exit(1)
    return outDict



def parseSamplesReal(csvfile):
    # for reading from directory
    #if os.path.isdir(readFileDir):
    #   sampleDict = samplesFromDirectory(readFileDir)
    if os.path.isfile(csvfile):
        sampleDict = real_from_csv(csvfile)
    else:
        sys.stderr.write("\n"
                         f"    FATAL: {csvfile} is neither a file nor directory.\n"
                         "\n")
        sys.exit(1)
    if len(sampleDict.keys()) == 0:
        sys.stderr.write("\n"
                         "    FATAL: We could not detect any samples at all.\n"
                         "\n")
        sys.exit(1)
    return sampleDict







