Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ED684F96BF
	for <lists+kgdb-bugreport@lfdr.de>; Fri,  8 Apr 2022 15:33:58 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1ncokP-00072K-L4
	for lists+kgdb-bugreport@lfdr.de; Fri, 08 Apr 2022 13:33:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <itaru.kitayama@gmail.com>) id 1ncm6d-00012O-IQ
 for kgdb-bugreport@lists.sourceforge.net; Fri, 08 Apr 2022 10:44:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=q84CpmN6HcAdLjwgnok8DT6LnoTrdsedTAsaK5EuaM4=; b=iqnmxwBrvu2dpllL/GRWb0yGuB
 iF/GcqNI4+PJ9MoLhbI/l+YXnPY+3OD2tfLG7smzCanwQXOz15jjYkwq6iKDUHiGjt50DOT2lnLC6
 c0efj1iva4ni/Z1e+uNlzuFHR/HYxm1dfSLmlIeVOb55DKQDUCobs89GXbb0HTv4NOXc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=q84CpmN6HcAdLjwgnok8DT6LnoTrdsedTAsaK5EuaM4=; b=eJymKvpg7j/9iVgs9NvULo2bEj
 kB269QAA9HmtT6LSe5TDc9MnuAVkCtrppSkBw8GYxXx2NEgz7vlPWWQx958xhmSgoO/GxsSV8SG7u
 ucNiLvqZ0UuEuOGf46g7+FdcJnDLHNkcN2AjhBbP/bqO8sIZYsEQzyZCc1L1RxMRL5qw=;
Received: from mail-vs1-f46.google.com ([209.85.217.46])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1ncm6b-0007xa-O8
 for kgdb-bugreport@lists.sourceforge.net; Fri, 08 Apr 2022 10:44:42 +0000
Received: by mail-vs1-f46.google.com with SMTP id l21so3041930vsm.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 08 Apr 2022 03:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=q84CpmN6HcAdLjwgnok8DT6LnoTrdsedTAsaK5EuaM4=;
 b=Z4P4yFSOUSMA9y9zFXitqSaVKi0NHwNN1KTzbODc5a2DaiWoogIdh6RKnXThQGYtdi
 uM1svG5l8LTJpUxTHnib37budyl6hIP4LBPuFkXWLPygL8SvGgbiZBAMQcYCVdqP9o0n
 HUmotu5gqCai7t4Vafn0KkXJtT33wb2467vPAnM/5rYfsDhG1vUtv8YjzdQP4eotDmLK
 99e3xiTyXTsaubmiTZsk1SNb093Dmu0MiQClzZMXUXpB+YjDsBvtlWHls4Z2GSYlasw9
 3hj1tcM/T18rjCo98RERlKBezQfPdej9tvDYyeuroFcToeDgm5nh9/NqUpqhRiktHv2r
 5WwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=q84CpmN6HcAdLjwgnok8DT6LnoTrdsedTAsaK5EuaM4=;
 b=650ae2Swbxob2I8XUGgRtMXOYdx69UqHuxOpe1+IQHO1d27X0Xy1xn2VH76KAJ0H1I
 lA8xlnRzYKmDZdgg24627e9y4M7yLM/7UZX9yInbCDfto77zqpH2XkdCV5EfizqawWNh
 Cz2tkcf+RzbQwFQ3tfMn8ZQ/d355eYJfkxX30ArsGEKKAM4cuN1sXBKPQhCYErGE1Rev
 R+hBJeLg4vNIuUqAC6CfCzP0/3mx8dSnSXTTL8/EbCNqYC71Vax8rHN3z13QpZIODMhQ
 9zUM1V0owGqXs3HvyzpV1zPmqBFppbcJtG4JenvaHJI9BHKLRX+KTAhsbL1Gt7Z2IGWO
 2m5Q==
X-Gm-Message-State: AOAM531qaI4bK63btaZOtakhdqA8EiQf0voEfMmS+GqDHIeLNWMRCkTj
 4LsicHXuKbquzf2dMt+OZowneCktIYfsa4nH9bQ=
X-Google-Smtp-Source: ABdhPJxjK6n4PMUa+0B+m32pYHOhwY0WKuX/21o5BeMt/s5oSpqtnDh3IFRtRrzi4nKQz20KwYV8OJQP7KmPVvHpKP4=
X-Received: by 2002:a67:c981:0:b0:320:92c2:d2ee with SMTP id
 y1-20020a67c981000000b0032092c2d2eemr5291342vsk.79.1649414673778; Fri, 08 Apr
 2022 03:44:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220331092235.3000787-1-hasegawa-hitomi@fujitsu.com>
 <20220331092235.3000787-2-hasegawa-hitomi@fujitsu.com>
 <YkWVTEG5oFO82GPL@kroah.com>
 <OSZPR01MB7050ED8D47839EAC9B4FC5BFEBE49@OSZPR01MB7050.jpnprd01.prod.outlook.com>
In-Reply-To: <OSZPR01MB7050ED8D47839EAC9B4FC5BFEBE49@OSZPR01MB7050.jpnprd01.prod.outlook.com>
From: Itaru Kitayama <itaru.kitayama@gmail.com>
Date: Fri, 8 Apr 2022 19:44:23 +0900
Message-ID: <CANW9uyvYSQNOAimKmJBmiWkfo4F+K9g+JOfoa+yFDLwSx2xcPQ@mail.gmail.com>
To: "hasegawa-hitomi@fujitsu.com" <hasegawa-hitomi@fujitsu.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Wondering if, Greg you approves Hitomi’s updated series,
    then you pick up it whatever the tree you maintain? Thanks, Itaru. On Fri,
    Apr 8, 2022 at 19:36 hasegawa-hitomi@fujitsu.com < wrote: 
 
 Content analysis details:   (-0.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [itaru.kitayama[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.217.46 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.217.46 listed in list.dnswl.org]
  0.0 HTML_MESSAGE           BODY: HTML included in message
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
X-Headers-End: 1ncm6b-0007xa-O8
X-Mailman-Approved-At: Fri, 08 Apr 2022 13:33:54 +0000
X-Content-Filtered-By: Mailman/MimeDel 2.1.21
Subject: Re: [Kgdb-bugreport] [PATCH v3 1/1] soc: fujitsu: Add A64FX
 diagnostic interrupt driver
X-BeenThere: kgdb-bugreport@lists.sourceforge.net
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: kgdb bugs suggestions <kgdb-bugreport.lists.sourceforge.net>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/kgdb-bugreport>, 
 <mailto:kgdb-bugreport-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=kgdb-bugreport>
List-Post: <mailto:kgdb-bugreport@lists.sourceforge.net>
List-Help: <mailto:kgdb-bugreport-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport>, 
 <mailto:kgdb-bugreport-request@lists.sourceforge.net?subject=subscribe>
Cc: "daniel.thompson@linaro.org" <daniel.thompson@linaro.org>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 "arnd@arndb.de" <arnd@arndb.de>, "peterz@infradead.org" <peterz@infradead.org>,
 Greg KH <gregkh@linuxfoundation.org>, "will@kernel.org" <will@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "olof@lixom.net" <olof@lixom.net>, "soc@kernel.org" <soc@kernel.org>,
 "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
 "jason.wessel@windriver.com" <jason.wessel@windriver.com>,
 "kgdb-bugreport@lists.sourceforge.net" <kgdb-bugreport@lists.sourceforge.net>,
 "jirislaby@kernel.org" <jirislaby@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

V29uZGVyaW5nIGlmLCBHcmVnIHlvdSBhcHByb3ZlcyBIaXRvbWnigJlzIHVwZGF0ZWQgc2VyaWVz
LCB0aGVuIHlvdSBwaWNrIHVwCml0IHdoYXRldmVyIHRoZSB0cmVlIHlvdSBtYWludGFpbj8KClRo
YW5rcywKSXRhcnUuCgpPbiBGcmksIEFwciA4LCAyMDIyIGF0IDE5OjM2IGhhc2VnYXdhLWhpdG9t
aUBmdWppdHN1LmNvbSA8Cmhhc2VnYXdhLWhpdG9taUBmdWppdHN1LmNvbT4gd3JvdGU6Cgo+IEhp
IEdyZWcsCj4KPiA+ID4gRW5hYmxlIGRpYWdub3N0aWMgaW50ZXJydXB0cyBmb3IgdGhlIEE2NEZY
Lgo+ID4gPiBUaGlzIGlzIGRvbmUgdXNpbmcgYSBwc2V1ZG8tTk1JLgo+ID4KPiA+IEkgZG8gbm90
IHVuZGVyc3RhbmQgd2hhdCB0aGlzIGRyaXZlciBpcywgc29ycnkuICBDYW4geW91IHBsZWFzZSBw
cm92aWRlCj4gbW9yZQo+ID4gaW5mb3JtYXRpb24gaW4gdGhlIGNoYW5nZWxvZyB0ZXh0IGZvciB3
aGF0IHRoaXMgaXMsIHdobyB3b3VsZCB1c2UgaXQsCj4gYW5kIGhvdyBpdCB3aWxsCj4gPiBiZSBp
bnRlcmFjdGVkIHdpdGguCj4KPiBJIHVuZGVyc3RhbmQuIEkgd2lsbCBhZGQgYSBkZXNjcmlwdGlv
biBpbiB0aGUgbmV4dCB2ZXJzaW9uLgo+Cj4gPiA+ICtjb25maWcgQTY0RlhfRElBRwo+ID4gPiAr
ICAgYm9vbCAiQTY0RlggZGlhZyBkcml2ZXIiCj4gPiA+ICsgICBkZXBlbmRzIG9uIEFSTTY0Cj4g
Pgo+ID4gV2hhdCBhYm91dCBBQ1BJPyAgU2hvdWxkbid0IHRoaXMgY29kZSBkZXBlbmQgb24gdGhh
dD8KPgo+IE9rZXkuIEkgd2lsbCBtYWtlIGl0IGRlcGVuZGVudCBvbiBBQ1BJLgo+Cj4gPiA+ICsg
ICBoZWxwCj4gPiA+ICsgICAgIFNheSBZIGhlcmUgaWYgeW91IHdhbnQgdG8gZW5hYmxlIGRpYWcg
aW50ZXJydXB0IG9uIEE2NEZYLgo+ID4KPiA+IFdoYXQgaXMgQTY0Rlg/Cj4KPiBBNjRGWCBpcyBh
IHByb2Nlc3NvciBkZXNpZ25lZCBieSBGdWppdHN1Lgo+IEZvciB0aGUgc2FrZSBvZiBjbGFyaXR5
LCBJIHdpbGwgZGVzY3JpYmUgaXQgYXMgIkZ1aml0c3UgQTY0RlgiLgo+Cj4gPiA+ICsgICAgIFRo
aXMgZHJpdmVyIHVzZXMgcHNldWRvLU5NSSBpZiBhdmFpbGFibGUuCj4gPgo+ID4gV2hhdCBkb2Vz
IHRoaXMgbWVhbj8KPgo+IFRoaXMgZHJpdmVyIHVzZXMgdGhlIHBzZXVkby1OTUkgZmVhdHVyZSB0
byBwZXJmb3JtIGRpYWdub3N0aWMgaW50ZXJydXB0cwo+IGZvciBBNjRGWC4gSG93ZXZlciwgSSBm
ZWx0IHRoYXQgaXQgd2FzIHN1cGVyZmx1b3VzIHRvIGdpdmUgdGhpcyBleHBsYW5hdGlvbgo+IGhl
cmUsIHNvIEkgd2lsbCBkZWxldGUgdGhpcyBzZW50ZW5jZS4KPgo+ID4gPiArICAgICBJZiB1bnN1
cmUsIHNheSBOLgo+ID4KPiA+IE5vIG1vZHVsZT8gIFdoeSBub3Q/Cj4KPiByZXF1ZXN0X25taSgp
IGlzIG5vdCBFWFBPUlRfU1lNQk9MLiBTbyB0aGlzIGRyaXZlciBjYW5ub3QgYmUgYSBtb2R1bGUu
Cj4KPiA+ID4gKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkKPiA+ID4g
Ky8qCj4gPiA+ICsgKiBBNjRGWCBkaWFnIGRyaXZlci4KPiA+Cj4gPiBObyBjb3B5cmlnaHQgaW5m
b3JtYXRpb24/ICBBcmUgeW91IHN1cmU/Cj4KPiBJIHdpbGwgYWRkIGNvcHlyaWdodCBpbmZvcm1h
dGlvbi4KPgo+ID4gPiArI2RlZmluZSBCTUNfRElBR19JTlRFUlJVUFRfU1RBVFVTX09GRlNFVCAo
MHgwMDQ0KSAjZGVmaW5lCj4gPiA+ICtCTUNfSU5URVJSVVBUX1NUQVRVU19NQVNLICgoMVUpIDw8
IDMxKQo+ID4KPiA+IEJJVCgpPwo+ID4KPiA+ID4gKyNkZWZpbmUgQk1DX0RJQUdfSU5URVJSVVBU
X0VOQUJMRV9PRkZTRVQgKDB4MDA0MCkgI2RlZmluZQo+ID4gPiArQk1DX0lOVEVSUlVQVF9FTkFC
TEVfTUFTSyAoKDFVKSA8PCAzMSkKPiA+Cj4gPiBCSVQoKT8KPgo+IE9rZXksIEkgd2lsbCB1c2Ug
QklUKCkuCj4KPiA+ID4gK3N0YXRpYyBpcnFyZXR1cm5fdCBhNjRmeF9kaWFnX2hhbmRsZXIoaW50
IGlycSwgdm9pZCAqZGV2X2lkKSB7Cj4gPiA+ICsgICBoYW5kbGVfc3lzcnEoJ2MnKTsKPiA+Cj4g
Pgo+ID4gV2h5IGlzIHRoaXMgY2FsbGluZyB0aGlzIHN5c3JxIGNhbGw/ICBGcm9tIGFuIGludGVy
cnVwdD8gIFdoeT8KPiA+Cj4gPiBBbmQgeW91IGFyZSBoYXJkLWNvZGluZyAiYyIsIGFyZSB5b3Ug
c3VyZT8KPgo+IEFzIG1lbnRpb25lZCBieSBBcm5kLCBJIG9ubHkgY2FsbGVkIHBhbmljICgpIGF0
IGZpcnN0LCBidXQgYWZ0ZXIgcmVjZWl2aW5nCj4gaGlzIHN1Z2dlc3Rpb24sIEkgZGVjaWRlZCB0
byBjYWxsIGhhbmRsZV9zeXNycSAoJ2MnKS4KPiBUaGlzIGRyaXZlciBvbmx5IHN1cHBvcnRzIHRo
ZSBmdW5jdGlvbiB0aGF0IGNhdXNlcyBhIHBhbmljIHdoZW4gcmVjZWl2aW5nCj4gYSBkaWFnbm9z
dGljIGludGVycnVwdCBmcm9tIHRoZSBvdXRzaWRlLCBzbyAiYyIgaXMgY29kZWQuCj4gQWxzbywg
bm8gZGF0YSBpcyBhZGRlZCB3aGVuIGEgZGlhZ25vc3RpYyBpbnRlcnJ1cHQgaXMgc2VudC4KPgo+
ID4gPiArICAgaWYgKG1tc2MgJiBCTUNfSU5URVJSVVBUX1NUQVRVU19NQVNLKQo+ID4gPiArICAg
ICAgICAgICB3cml0ZWwoQk1DX0lOVEVSUlVQVF9TVEFUVVNfTUFTSywgKHZvaWQKPiA+ICopZGlh
Z19zdGF0dXNfcmVnX2FkZHIpOwo+ID4KPiA+IE5vIG5lZWQgdG8gd2FpdCBmb3IgdGhlIHdyaXRl
IHRvIGNvbXBsZXRlPwo+ID4KPiA+IFlvdSBzaG91bGRuJ3QgaGF2ZSB0byBjYXN0IGRpYWdfc3Rh
dHVzX3JlZ19hZGRyLCByaWdodD8KPgo+IER1ZSB0byB0aGUgc3BlY2lmaWNhdGlvbnMgb2YgdGhl
IG1hY2hpbmUsIHRoZXJlIGlzIG5vIHByb2JsZW0gZXZlbgo+IGlmIHRoZXJlIGlzIG5vIHdyaXRl
IHdhaXQgcHJvY2Vzc2luZy4KPgo+IEkgd2lsbCByZW1vdmUgY29uc3RhbnQgYW5kICh2b2lkICop
LiBUaGFuayB5b3UgZm9yIHBvaW50aW5nIG91dC4KPgo+ID4gPiArICAgICAgICAgICBlbmFibGVf
aXJxKHByaXYtPmlycSk7Cj4gPiA+ICsgICAgICAgICAgIHByaXYtPmhhc19ubWkgPSBmYWxzZTsK
PiA+ID4gKyAgICAgICAgICAgZGV2X2luZm8oZGV2LCAicmVnaXN0ZXJlZCBmb3IgSVJRICVkXG4i
LCBwcml2LT5pcnEpOwo+ID4gPiArICAgfSBlbHNlIHsKPiA+ID4gKyAgICAgICAgICAgZW5hYmxl
X25taShwcml2LT5pcnEpOwo+ID4gPiArICAgICAgICAgICBwcml2LT5oYXNfbm1pID0gdHJ1ZTsK
PiA+ID4gKyAgICAgICAgICAgZGV2X2luZm8oZGV2LCAicmVnaXN0ZXJlZCBmb3IgTk1JICVkXG4i
LCBwcml2LT5pcnEpOwo+ID4KPiA+IFdoZW4gZHJpdmVycyBhcmUgc3VjY2Vzc2Z1bCwgdGhleSBh
cmUgcXVpZXQuICBObyBuZWVkIGZvciB0aGUgbm9pc2UgaGVyZS4KPgo+IEkgd2lsbCByZW1vdmUg
dGhlIG1lc3NhZ2UgZm9yIGEgc3VjY2Vzc2Z1bCBOTUkvSVJRIHJlZ2lzdHJhdGlvbi4KPgo+IFRo
YW5rIHlvdS4KPiBIaXRvbWkgSGFzZWdhd2EKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwo+IGxpbnV4LWFybS1rZXJuZWwgbWFpbGluZyBsaXN0Cj4gbGlu
dXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hcm0ta2VybmVsCj4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCktnZGItYnVncmVwb3J0IG1haWxpbmcg
bGlzdApLZ2RiLWJ1Z3JlcG9ydEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5z
b3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8va2dkYi1idWdyZXBvcnQK
