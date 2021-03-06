#ifndef AMDGPUPROOVC_H
#define AMDGPUPROOVC_H

#include <vector>

#include "amdgpuadapterhandle.h"
#include "structs.h"
#include "conststrings.h"

class AmdGpuProOvc
{

private:

    static void setFanSpeeds(int adaptersNum, std::vector<FanSpeedSetup> fanSpeedSetups, AMDGPUAdapterHandle& Handle_);

    static void checkFanSpeeds(const std::vector<OVCParameter>& ovcParams, bool& failed);

    static void checkAdapterIndicies(const std::vector<OVCParameter>& ovcParams, int adaptersNum, bool & failed);

    static void checkParameters(const std::vector<OVCParameter>& ovcParams, int adaptersNum, const std::vector<PerfClocks>& perfClocksList, bool & failed);

    static void throwErrorOnFailed(bool failed);

    static void printFanSpeedChanges(const std::vector<OVCParameter>& ovcParams, int adaptersNum);

    static void printParameterChanges(const std::vector<OVCParameter>& ovcParams, int adaptersNum);

    static void setFanSpeedSetup(std::vector<FanSpeedSetup>& fanSpeedSetups, const std::vector<OVCParameter>& ovcParams, int adaptersNum);

    static void setParameters(AMDGPUAdapterHandle& handle_, const std::vector<OVCParameter>& ovcParams, int adaptersNum, const std::vector<PerfClocks>& perfClocksList);

public:

    static void Set(AMDGPUAdapterHandle& Handle_, const std::vector<OVCParameter>& OvcParams, const std::vector<PerfClocks>& PerfClocksList);

};

#endif /* AMDGPUPROOVC_H */
