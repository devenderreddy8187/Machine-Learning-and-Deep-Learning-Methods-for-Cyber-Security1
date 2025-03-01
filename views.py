import re

from django.contrib import messages
from django.contrib.auth import authenticate
from django.db.models import Q, Count
from django.shortcuts import render, redirect

# Create your views here.
from User.forms import UserRegister_Form
from User.models import UserRegister_Model, UserAdd_Model


def user_login(request):
    if request.method == "POST":
        name = request.POST.get('name')
        password = request.POST.get('password')
        try:

            check = UserRegister_Model.objects.get(name=name,password=password)
            request.session['userid'] = check.id
            return redirect('user_adddata')
        except:
            pass
        user = authenticate(name=name,password=password)
        if user is not None:
            if user.is_active:


                return redirect('user_adddata')
        else:

            messages.error(request, 'username or password are not match')


            return redirect('user_login')

    return render(request, 'users/user_login.html')


def user_register(request):
    if request.method == "POST":
        forms = UserRegister_Form(request.POST)
        if forms.is_valid():
            forms.save()
            messages.success(request, 'You have been successfully registered')
            return redirect('user_login')
    else:
        forms = UserRegister_Form()

    return render(request,'users/user_register.html',{'form':forms})


def user_adddata(request):
    userid = request.session["userid"]
    obj = UserRegister_Model.objects.get(id=userid)
    attack1 = []
    attack2, attack3, attack4, attack5, attack6, attack7, attack8, attack9 = [], [], [], [], [], [], [], []

    splt = ''
    Entity = ''
    Year = 0
    Records = ''
    Organizationtype = ''
    Method = ''
    txt =''
    Adddata = ''
    ans = ''
    Time = ''
    if request.method == "POST":
        Entity = request.POST.get("entity")
        Year = request.POST.get("year")
        Records = request.POST.get("records")
        Organizationtype = request.POST.get("organizationtype")
        Method = request.POST.get("method")
        txt = request.POST.get("name")
        Time = request.POST.get("time")




        splt = (re.findall(r"[\w']+", str(txt)))

    for f in splt:
        if f in ('IPid', 'FDDI', 'x25', 'rangingdistance'):
            attack1.append(f)
        elif f in ('tcpchecksum', 'mtcp', 'controlflags', 'tcpoffset', 'tcpport'):
            attack2.append(f)
        elif f in ('ICMPID', 'udptraffic', 'udpunicorn', 'datagramid', 'NTP', 'RIP', 'TFTP'):
            attack3.append(f)
        elif f in ('GETID', 'POSTID', 'openBSD', 'appid', 'sessionid', 'transid', 'physicalid'):
            attack4.append(f)
        elif f in ('SYN', 'ACK', 'synpacket', 'sycookies'):
            attack5.append(f)
        elif f in ('serverattack', 'serverid', 'blockbankwidth'):
            attack6.append(f)
        elif f in ('monlist', 'getmonlist', 'NTPserver'):
            attack7.append(f)
        elif f in ('portid', 'FTPID', 'tryion', 'fragflag'):
            attack8.append(f)
        elif f in ('malwareid', 'gethttpid', 'httpid'):
            attack9.append(f)

    if len(attack1) > len(attack2) and len(attack1) > len(attack3) and len(attack1) > len(attack4) and len(
            attack1) > len(attack5) and len(attack1) > len(attack6) and len(attack1) > len(attack7) and len(
        attack1) > len(attack8) and len(attack1) > len(attack9):
        ans = "Denial-of-service attack"
    elif len(attack2) > len(attack1) and len(attack2) > len(attack3) and len(attack2) > len(attack4) and len(
            attack2) > len(attack5) and len(attack2) > len(attack6) and len(attack2) > len(attack7) and len(
        attack2) > len(attack8) and len(attack2) > len(attack9):
        ans = "probing attack "
    elif len(attack3) > len(attack2) and len(attack3) > len(attack1) and len(attack3) > len(attack4) and len(
            attack1) > len(attack5) and len(attack1) > len(attack6) and len(attack1) > len(attack7) and len(
        attack1) > len(attack8) and len(attack1) > len(attack9):
        ans = "Hacking probing attack "
    elif len(attack4) > len(attack2) and len(attack4) > len(attack3) and len(attack4) > len(attack1) and len(
            attack4) > len(attack5) and len(attack4) > len(attack6) and len(attack4) > len(attack7) and len(
        attack4) > len(attack8) and len(attack4) > len(attack9):
        ans = " Remote to User (R2L) Attacks"
    elif len(attack5) > len(attack2) and len(attack5) > len(attack3) and len(attack5) > len(attack4) and len(
            attack5) > len(attack1) and len(attack5) > len(attack6) and len(attack5) > len(attack7) and len(
        attack5) > len(attack8) and len(attack5) > len(attack9):
        ans = "User to Root attack"
    elif len(attack6) > len(attack2) and len(attack6) > len(attack3) and len(attack6) > len(attack4) and len(
            attack6) > len(attack5) and len(attack6) > len(attack1) and len(attack6) > len(attack7) and len(
        attack6) > len(attack8) and len(attack6) > len(attack9):
        ans = "Denial-of-service attack"
    elif len(attack7) > len(attack2) and len(attack7) > len(attack3) and len(attack7) > len(attack4) and len(
            attack7) > len(attack5) and len(attack7) > len(attack6) and len(attack7) > len(attack1) and len(
        attack7) > len(attack8) and len(attack7) > len(attack9):
        ans = "probing attack"
    elif len(attack8) > len(attack2) and len(attack8) > len(attack3) and len(attack8) > len(attack4) and len(
            attack8) > len(attack5) and len(attack8) > len(attack6) and len(attack8) > len(attack7) and len(
        attack8) > len(attack1) and len(attack8) > len(attack9):
        ans = "Hacking probing attack "
    elif len(attack9) > len(attack2) and len(attack9) > len(attack3) and len(attack9) > len(attack4) and len(
            attack9) > len(attack5) and len(attack9) > len(attack6) and len(attack9) > len(attack7) and len(
        attack9) > len(attack8) and len(attack9) > len(attack1):
        ans = "Remote to User (R2L) Attacks"

    else:
        ans = "nonattack"
    UserAdd_Model.objects.create(uregid=obj,entity=Entity,year=Year,records=Records,organizationtype=Organizationtype,method=Method,adddata=txt,attackresult=ans,time=Time)


    return render(request,'users/user_adddata.html')

def user_page(request):
    obj = UserAdd_Model.objects.all()
    return render(request,'users/user_page.html',{'object':obj})


def attack(request):
    obj = UserAdd_Model.objects.filter(Q(attackresult='Denial-of-service attack') | Q(attackresult='probing attack') | Q(
        attackresult='Hacking probing attack ') | Q(attackresult='Remote to User (R2L) Attacks') | Q(
        attackresult='User to Root attack') | Q(attackresult='Denial-of-service attack') | Q(attackresult='probing attack') | Q(
        attackresult='Hacking probing attack') | Q(attackresult='Remote to User (R2L) Attacks'))
    return render(request,'users/attack.html',{'object':obj})

def nonattack(request):
    obj = UserAdd_Model.objects.filter(attackresult='nonattack')
    return render(request,'users/nonattack.html',{'object':obj})

def cyber_analysis(request):
    chart = UserAdd_Model.objects.values('attackresult','method').annotate(dcount=Count('attackresult'))
    return render(request,'users/cyber_analysis.html',{'objects':chart})

def chart_page(request,chart_type):
    chart = UserAdd_Model.objects.values('year').annotate(dcount=Count('organizationtype'))
    return render(request,'users/chart_page.html',{'chart_type':chart_type,'objects':chart})