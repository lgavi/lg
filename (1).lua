function editData(qmnb,qmxg)gg.setVisible(false)gg.clearResults()qmnbv=qmnb[3]["value"]or qmnb[3][1]qmnbt=qmnb[3]["type"]or qmnb[3][2]qmnbn=qmnb[2]["name"]or qmnb[2][1]gg.setRanges(qmnb[1]["memory"]or qmnb[1][1])gg.searchNumber(qmnbv,qmnbt)gg.refineNumber(qmnbv,qmnbt)sz=gg.getResultCount()if sz==0 then gg.toast(qmnbn.."开启失败")else sl=gg.getResults(999999)for i=1,sz do pdsz=true for v=4,#qmnb do if pdsz==true then pysz={{}}pysz[1].address=sl[i].address+(qmnb[v]["offset"]or qmnb[v][2])pysz[1].flags=qmnb[v]["type"]or qmnb[v][3]szpy=gg.getValues(pysz)tzszpd=tostring(qmnb[v]["lv"]or qmnb[v][1]):gsub(",","")pyszpd=tostring(szpy[1].value):gsub(",","")if tzszpd==pyszpd then pdjg=true pdsz=true else pdjg=false pdsz=false end end end if pdjg==true then szpy=sl[i].address for x=1,#qmxg do xgsz=qmxg[x]["value"]or qmxg[x][1]xgpy=szpy+(qmxg[x]["offset"]or qmxg[x][2])xglx=qmxg[x]["type"]or qmxg[x][3]xgdj=qmxg[x]["freeze"]or qmxg[x][4]xg={{address=xgpy,flags=xglx,value=xgsz}}if xgdj==true then xg[1].freeze=xgdj gg.addListItems(xg)else gg.setValues(xg)end end xgjg=true end end if xgjg==true then gg.toast(qmnbn.."开启成功")else gg.toast(qmnbn.."开启失败")end end end

D=gg.TYPE_DWORD  E=gg.TYPE_DOUBLE  F=gg.TYPE_FLOAT W=gg.TYPE_WORD B=gg.TYPE_BYTE X=gg.TYPE_XOR Q=gg.TYPE_QWORD

function readValue(address, flags) return gg.getValues({{address = address, flags = flags}})[1]["value"]end
function search(ss,lx,nc,dz1,dz2) if ss~=nil then if lx~=nil then  if nc==nil then nc=32 end  gg.setRanges(nc)  if dz1==nil then dz1="-1" end  if dz2==nil then dz1="0" end  gg.searchNumber(ss,lx,false,gg.SIGN_EQUAL,dz1,dz2)  sl=gg.getResultCount()  if sl~=0 then  sj=gg.getResults(sl)  gg.toast("搜索到 "..sl.." 个结果")  gg.clearResults()  else  gg.toast("未搜索到结果")  end  else  gg.toast("无搜索值类型")  end  else  gg.toast("无需搜索值")  end  end  function py1(value,lx,py)  if #sj~=nil then  z1={} z2={}  for i=1,#sj do  z1[1]={}  z1[1].address=sj[i].address+py  z1[1].flags=lx  z1=gg.getValues(z1)  if z1[1].value==value then  z2[#z2+1]={}  z2[#z2]=sj[i]  end end  sj=z2  z1={} z2={}  gg.toast("共偏移 "..#sj.." 个数据")  else  gg.toast("没有搜索数据")  end  end  function py2(value,lx,py)  if #sj~=nil then  z1={} z2={}  for i=1,#sj do  z1[1]={}  z1[1].address=sj[i].address+py  z1[1].flags=lx  z1=gg.getValues(z1)  if z1[1].value~=value then  z2[#z2+1]={}  z2[#z2]=sj[i]  end end  sj=z2  z1={} z2={}  gg.toast("共偏移 "..#sj.." 个数据")  else  gg.toast("没有搜索数据")  end  end
function xg1(value,lx,py,dj) if #sj~=nil then z={} for i=1,#sj do z[i]={} z[i].address=sj[i].address+py z[i].flags=lx if value == nil then value = readValue(z[i].address, lx) end z[i].value= value z[i].freeze = dj and true or false end if dj == true or dj == false then gg.addListItems(z) else gg.setValues(z) end gg.toast("共修改 "..#z.." 个数据") else gg.toast("没有搜索数据") end end
function xg2(bz,value,lx,py,dj)  if #bz~=nil then  z={}  for i=1,#bz do  z[i]={}  z[i].address=bz[i].address+py  z[i].flags=lx  z[i].value=value  if dj==true then z[i].freeze=true end  end  if dj==true then  gg.addListItems(z)  else  gg.clearList()  gg.setValues(z)  end  gg.toast("共修改 "..#z.." 个数据")  else  gg.toast("没有搜索数据")  end  end  function bc(bz)  if sj~=nil then  _ENV[bz]=sj  else  gg.toast("无数据")  end  end  


function split(szFullString, szSeparator)   local nFindStartIndex = 1   local nSplitIndex = 1   local nSplitArray = {}   while true do   local nFindLastIndex = string.find  (szFullString, szSeparator, nFindStartIndex)   if not nFindLastIndex then   nSplitArray[nSplitIndex] =   string.sub(szFullString, nFindStartIndex, string.len  (szFullString))   break end   nSplitArray[nSplitIndex] = string.sub  (szFullString, nFindStartIndex, nFindLastIndex - 1)   nFindStartIndex = nFindLastIndex + string.len  (szSeparator)   nSplitIndex = nSplitIndex + 1 end return   nSplitArray end   function xgxc(szpy, qmxg)   for x = 1, #(qmxg) do   xgpy = szpy + qmxg[x]["offset"]   xglx = qmxg[x]["type"]   xgsz = qmxg[x]["value"]   xgdj = qmxg[x]["freeze"]   if xgdj == nil or xgdj == "" then   gg.setValues({[1]   = {address = xgpy, flags = xglx, value = xgsz}})   else   gg.addListItems({[1]   = {address = xgpy, flags = xglx,   freeze = xgdj, value = xgsz}}) end   xgsl = xgsl + 1 xgjg = true end end   function xqmnb(qmnb)   gg.clearResults()   gg.setRanges(qmnb[1]["memory"])   gg.searchNumber(qmnb[3]["value"], qmnb[3]["type"])   if gg.getResultCount() == 0 then   gg.toast(qmnb[2]["name"] .. "开启失败")   else   gg.refineNumber(qmnb[3]["value"], qmnb[3]["type"])  gg.refineNumber(qmnb[3]["value"], qmnb[3]["type"])   gg.refineNumber(qmnb[3]["value"], qmnb[3]["type"])   if gg.getResultCount() == 0 then   gg.toast(qmnb[2]["name"] .. "开启失败")   else           sl = gg.getResults(999999)   sz = gg.getResultCount()           xgsl = 0 if sz > 999999 then   sz = 999999 end for i = 1, sz do   pdsz = true for v = 4, #(qmnb) do if   pdsz == true then   pysz = {} pysz[1]   = {} pysz[1].address   = sl[i].address + qmnb[v]["offset"] pysz[1].flags   = qmnb[v]["type"]   szpy = gg.getValues(pysz)   pdpd = qmnb[v]["lv"] .. ";" .. szpy[1].value szpd   = split(pdpd, ";") tzszpd   = szpd[1] pyszpd = szpd[2]   if tzszpd == pyszpd then   pdjg = true pdsz = true else   pdjg = false pdsz = false end end end if   pdjg == true then szpy   = sl[i].address xgxc(szpy, qmxg) end end   if xgjg == true then   gg.toast(qmnb[2]["name"] .. "开启成功,共修改" .. xgsl .. "条数据")   else   gg.toast(qmnb[2]["name"] .. "开启失败")   end   end   end   end 

local startTime = os.time()
function offsetEdit(start, offset, distort)
	gg.setVisible(false)
    gg.clearResults()
    gg.setRanges(start[1])
    gg.searchNumber(start[2], start[3])

    local printVal = gg.getResults(99999)
    if #printVal == 0 then
        print("未找到结果")
        return
    end

    local OffsetTable = {}
    for i = 1, #offset, 3 do
        OffsetTable[#OffsetTable+1] = {
            value = offset[i],
            offset = offset[i+1],
            flags = offset[i+2]
        }
    end

    local validAddresses = {}

    local checkAddresses = {}
    for _, entry in ipairs(printVal) do
        for _, offsetEntry in ipairs(OffsetTable) do
            local newAddress = entry.address + offsetEntry.offset
            table.insert(checkAddresses, {address = newAddress, flags = offsetEntry.flags})
        end
    end

    local checkResults = gg.getValues(checkAddresses)

    local checkResultsMap = {}
    for _, result in ipairs(checkResults) do
        checkResultsMap[result.address] = result.value
    end

    for _, entry in ipairs(printVal) do
        local allValuesFound = true
        for _, offsetEntry in ipairs(OffsetTable) do
            local newAddress = entry.address + offsetEntry.offset
            if checkResultsMap[newAddress] ~= offsetEntry.value then
                allValuesFound = false
                break
            end
        end

        if allValuesFound then
            validAddresses[#validAddresses + 1] = entry
        end
    end

    if #validAddresses > 0 then
        modify = {}
        for k, v in ipairs(validAddresses) do
        	modify[#modify+1] = {
        		address = v.address + distort[2],
        		flags = distort[3],
        		value = distort[1],
        		freeze = distort[4]
        	}
        end
        if distort[4] == true then
        	gg.addListItems(modify)
        else
	        gg.setValues(modify)
        end
        gg.clearResults()
        gg.toast("有效地址" .. #validAddresses)
    else
        gg.toast("未找到有效地址")
    end
end
-- 40万结果只需4秒



DWORD=gg.TYPE_DWORD  DOUBLE=gg.TYPE_DOUBLE  FLOAT=gg.TYPE_FLOAT WORD=gg.TYPE_WORD BYTE=gg.TYPE_BYTE XOR=gg.TYPE_XOR QWORD=gg.TYPE_QWORD

if io.open('/sdcard/Android/data/ts')==nil then
io.open('/sdcard/Android/data/ts','w'):write('1')
else
ts=io.open('/sdcard/Android/data/ts'):read('*a')
io.open('/sdcard/Android/data/ts','w'):write(ts+1)
end


function Main()
  SN=gg.choice({
"8个宝珠",
"人物玛雅",
"0级玛雅开局暴走2500米竞技场",
"一万钻石",
"6百万金币",
"6张段位保护卡",
"双倍金币",
"终身至尊礼包",
"850钻石礼包",
"重生特权",
"去除广告",
"解锁地图",
"0级玛雅开局暴走一万米竞技场",
"0级玛雅开局暴走一百万米",
"玛雅速度上限",
"万圣司命",
"赤金羽翼",
"火焰之力",
"穷奇",
"赤焰凤凰",
"无尽联赛王者头像框",
"左右移动爆分",
"恢复",
"退出",
}, nil, "暴走大厅开启 修改一项开一个宝珠箱子 物品用完后再修改 以上数量为上限  ")
if SN==1 then HS1() end
if SN==2 then HS2() end
if SN==3 then HS3() end
if SN==4 then HS4() end
if SN==5 then HS5() end
if SN==6 then HS6() end
if SN==7 then HS7() end
if SN==8 then HS8() end
if SN==9 then HS9() end
if SN==10 then HS10() end
if SN==11 then HS11() end
if SN==12 then HS12() end
if SN==13 then HS13() end
if SN==14 then HS14() end
if SN==15 then HS15() end
if SN==16 then HS16() end
if SN==17 then HS17() end
if SN==18 then HS18() end
if SN==19 then HS19() end
if SN==20 then HS20() end
if SN==21 then HS21() end
if SN==22 then HS22() end
if SN==23 then HS23() end
if SN==24 then os.exit() end
FX1=0
end

function HS1()
-- 40万结果只需4秒
offsetEdit(
    {32, 1.5, 16}, -- 内存, 搜索值, 类型
      {0.5,8,16,
-- 数值, 偏移, 类型
     20,148,16,

       0,216,16},

       {0.1,224,16
       }
 -- 修改值, 偏移, 类型, 冻结
)
local endTime = os.time()
local elapsedTime = endTime - startTime
print("耗时 " .. elapsedTime .. " 秒")
end


function Exit()
   print("分享学习资料https://share.weiyun.com/5y7RO2U")
  os.exit()
end

while true do
if gg.isVisible(true) then
    FX1 = nil
    gg.setVisible(false)
  end
  if FX1 == nil then
    Main()
  end
end

