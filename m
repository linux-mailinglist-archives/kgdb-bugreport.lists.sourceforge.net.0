Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DE32270F566
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 24 May 2023 13:36:36 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1q1mnC-0003iu-Pb
	for lists+kgdb-bugreport@lfdr.de;
	Wed, 24 May 2023 11:36:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pmladek@suse.com>) id 1q1mnB-0003ih-Fe
 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 24 May 2023 11:36:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FwAKYD0z8pW+9JaKpkN3toV9DOYGVk/tLA54UTMvFvs=; b=gW80ewpMGnwtpMPQaKw1D2lr0n
 5IPnApi4DGaracob6N4fksTheR1zpI14CP0f4eAL+6fpj09ia4v6XaE5WP0HG/a7oYLQktQlLR0CV
 s/PX7pZNkd7Est6fYibazKyvqZ0njq47AgOGkAa9TPiywiIgsn4dNnIHAjB1whRc+4IM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=FwAKYD0z8pW+9JaKpkN3toV9DOYGVk/tLA54UTMvFvs=; b=LqQozIyLC6NgrYwrqFpyKAV2cm
 YGOJcCtnnSRSLE6ZJa0FgEe30X8IQEKQXR6Rxx8/CdW15SEfYkWvvpIZUXcHoDdELXS1+6puiTTLD
 axphYoJ/k3bw4Sx82fx+s88qVVK9d6GU7PJi8+kjb+YNV+QUA1IYX4qs2sQQhhMOGetg=;
Received: from smtp-out2.suse.de ([195.135.220.29])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1q1mn9-0005Nx-Q2 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 24 May 2023 11:36:33 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 9C4BE1FDC9;
 Wed, 24 May 2023 11:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1684928179; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FwAKYD0z8pW+9JaKpkN3toV9DOYGVk/tLA54UTMvFvs=;
 b=fuotTz0Kyq5RkgGokrnxG609dhdlh7eXS5CeqjYq8WXFYQqLE3agWtLLSFpliodMeB7s5V
 xx7rusJnt2o8u0wKAllTdf9IBYj+WdwndCGv/le9IbX/t2yIPOWBM2uADVMEuQDfpGTlvu
 EOMqQltqypCXcFmrWIB/10NPqWeXfio=
Received: from suse.cz (dhcp129.suse.cz [10.100.51.129])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 7D0452C141;
 Wed, 24 May 2023 11:36:15 +0000 (UTC)
Date: Wed, 24 May 2023 13:36:15 +0200
To: Doug Anderson <dianders@chromium.org>
Message-ID: <ZG32r9Izc9K1Z3IJ@alley>
References: <20230519101840.v5.18.Ia44852044cdcb074f387e80df6b45e892965d4a1@changeid>
 <20230519101840.v5.10.I3a7d4dd8c23ac30ee0b607d77feb6646b64825c0@changeid>
 <ZGzjm9h85fpYZJMc@alley>
 <CAD=FV=VeGKTvw2=qhSqkSEtYwVrXGLNzNbgBAwrmn2CWWfJckQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAD=FV=VeGKTvw2=qhSqkSEtYwVrXGLNzNbgBAwrmn2CWWfJckQ@mail.gmail.com>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Tue 2023-05-23 09:34:37, Doug Anderson wrote: > Hi, > >
    On Tue, May 23, 2023 at 9:02 AM Petr Mladek <pmladek@suse.com> wrote: >
    > > > On Fri 2023-05-19 10:18:34, Douglas Anderson wrote: > > > In [...] 
 
 Content analysis details:   (-2.5 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
                             medium trust
                             [195.135.220.29 listed in list.dnswl.org]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
X-Headers-End: 1q1mn9-0005Nx-Q2
Subject: Re: [Kgdb-bugreport] [PATCH v5 10/18] watchdog/hardlockup: Add a
 "cpu" param to watchdog_hardlockup_check()
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
From: Petr Mladek via Kgdb-bugreport <kgdb-bugreport@lists.sourceforge.net>
Reply-To: Petr Mladek <pmladek@suse.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Ian Rogers <irogers@google.com>,
 ito-yuichi@fujitsu.com, Lecopzer Chen <lecopzer.chen@mediatek.com>,
 kgdb-bugreport@lists.sourceforge.net, ricardo.neri@intel.com,
 Stephane Eranian <eranian@google.com>, sparclinux@vger.kernel.org,
 Guenter Roeck <groeck@chromium.org>, Will Deacon <will@kernel.org>,
 Daniel Thompson <daniel.thompson@linaro.org>, Andi Kleen <ak@linux.intel.com>,
 Marc Zyngier <maz@kernel.org>, christophe.leroy@csgroup.eu,
 Chen-Yu Tsai <wens@csie.org>, Matthias Kaehlcke <mka@chromium.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Masayoshi Mizuma <msys.mizuma@gmail.com>, ravi.v.shankar@intel.com,
 Tzung-Bi Shih <tzungbi@chromium.org>, npiggin@gmail.com,
 Stephen Boyd <swboyd@chromium.org>, Pingfan Liu <kernelfans@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Randy Dunlap <rdunlap@infradead.org>,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 mpe@ellerman.id.au, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

T24gVHVlIDIwMjMtMDUtMjMgMDk6MzQ6MzcsIERvdWcgQW5kZXJzb24gd3JvdGU6Cj4gSGksCj4g
Cj4gT24gVHVlLCBNYXkgMjMsIDIwMjMgYXQgOTowMuKAr0FNIFBldHIgTWxhZGVrIDxwbWxhZGVr
QHN1c2UuY29tPiB3cm90ZToKPiA+Cj4gPiBPbiBGcmkgMjAyMy0wNS0xOSAxMDoxODozNCwgRG91
Z2xhcyBBbmRlcnNvbiB3cm90ZToKPiA+ID4gSW4gcHJlcGFyYXRpb24gZm9yIHRoZSBidWRkeSBo
YXJkbG9ja3VwIGRldGVjdG9yIHdoZXJlIHRoZSBDUFUKPiA+ID4gY2hlY2tpbmcgZm9yIGxvY2t1
cCBtaWdodCBub3QgYmUgdGhlIGN1cnJlbnRseSBydW5uaW5nIENQVSwgYWRkIGEKPiA+ID4gImNw
dSIgcGFyYW1ldGVyIHRvIHdhdGNoZG9nX2hhcmRsb2NrdXBfY2hlY2soKS4KPiA+ID4KPiA+ID4g
QXMgcGFydCBvZiB0aGlzIGNoYW5nZSwgbWFrZSBocnRpbWVyX2ludGVycnVwdHMgYW4gYXRvbWlj
X3Qgc2luY2Ugbm93Cj4gPiA+IHRoZSBDUFUgaW5jcmVtZW50aW5nIHRoZSB2YWx1ZSBhbmQgdGhl
IENQVSByZWFkaW5nIHRoZSB2YWx1ZSBtaWdodCBiZQo+ID4gPiBkaWZmZXJlbnQuIFRlY2huaWFs
bHkgdGhpcyBjb3VsZCBhbHNvIGJlIGRvbmUgd2l0aCBqdXN0IFJFQURfT05DRSBhbmQKPiA+ID4g
V1JJVEVfT05DRSwgYnV0IGF0b21pY190IGZlZWxzIGEgbGl0dGxlIGNsZWFuZXIgaW4gdGhpcyBj
YXNlLgo+ID4gPgo+ID4gPiBXaGlsZSBocnRpbWVyX2ludGVycnVwdHMgaXMgbWFkZSBhdG9taWNf
dCwgd2UgY2hhbmdlCj4gPiA+IGhydGltZXJfaW50ZXJydXB0c19zYXZlZCBmcm9tICJ1bnNpZ25l
ZCBsb25nIiB0byAiaW50Ii4gVGhlICJpbnQiIGlzCj4gPiA+IG5lZWRlZCB0byBtYXRjaCB0aGUg
ZGF0YSB0eXBlIGJhY2tpbmcgYXRvbWljX3QgZm9yIGhydGltZXJfaW50ZXJydXB0cy4KPiA+ID4g
RXZlbiBpZiB0aGlzIGNoYW5nZXMgdXMgZnJvbSA2NC1iaXRzIHRvIDMyLWJpdHMgKHdoaWNoIEkg
ZG9uJ3QgdGhpbmsKPiA+ID4gaXMgdHJ1ZSBmb3IgbW9zdCBjb21waWxlcnMpLCBpdCBkb2Vzbid0
IHJlYWxseSBtYXR0ZXIuIEFsbCB3ZSBldmVyIGRvCj4gPiA+IGlzIGluY3JlbWVudCBpdCBldmVy
eSBmZXcgc2Vjb25kcyBhbmQgY29tcGFyZSBpdCB0byBhbiBvbGQgdmFsdWUgc28KPiA+ID4gMzIt
Yml0cyBpcyBmaW5lIChldmVuIDE2LWJpdHMgd291bGQgYmUpLiBUaGUgInNpZ25lZCIgdnMgInVu
c2lnbmVkIgo+ID4gPiBhbHNvIGRvZXNuJ3QgbWF0dGVyIGZvciBzaW1wbGUgZXF1YWxpdHkgY29t
cGFyaXNvbnMuCj4gPiA+Cj4gPiA+IGhydGltZXJfaW50ZXJydXB0c19zYXZlZCBpcyBfbm90XyBz
d2l0Y2hlZCB0byBhdG9taWNfdCBub3IgZXZlbgo+ID4gPiBhY2Nlc3NlZCB3aXRoIFJFQURfT05D
RSAvIFdSSVRFX09OQ0UuIFRoZSBocnRpbWVyX2ludGVycnVwdHNfc2F2ZWQgaXMKPiA+ID4gYWx3
YXlzIGNvbnNpc3RlbnRseSBhY2Nlc3NlZCB3aXRoIHRoZSBzYW1lIENQVS4gTk9URTogd2l0aCB0
aGUKPiA+ID4gdXBjb21pbmcgImJ1ZGR5IiBkZXRlY3RvciB0aGVyZSBpcyBvbmUgc3BlY2lhbCBj
YXNlLiBXaGVuIGEgQ1BVIGdvZXMKPiA+ID4gb2ZmbGluZS9vbmxpbmUgdGhlbiB3ZSBjYW4gY2hh
bmdlIHdoaWNoIENQVSBpcyB0aGUgb25lIHRvIGNvbnNpc3RlbnRseQo+ID4gPiBhY2Nlc3MgYSBn
aXZlbiBpbnN0YW5jZSBvZiBocnRpbWVyX2ludGVycnVwdHNfc2F2ZWQuIFdlIHN0aWxsIGNhbid0
Cj4gPiA+IGVuZCB1cCB3aXRoIGEgcGFydGlhbGx5IHVwZGF0ZWQgaHJ0aW1lcl9pbnRlcnJ1cHRz
X3NhdmVkLCBob3dldmVyLAo+ID4gPiBiZWNhdXNlIHdlIGVuZCB1cCBwZXR0aW5nIGFsbCBhZmZl
Y3RlZCBDUFVzIHRvIG1ha2Ugc3VyZSB0aGUgbmV3IGFuZAo+ID4gPiBvbGQgQ1BVIGNhbid0IGVu
ZCB1cCBzb21laG93IHJlYWQvd3JpdGUgaHJ0aW1lcl9pbnRlcnJ1cHRzX3NhdmVkIGF0Cj4gPiA+
IHRoZSBzYW1lIHRpbWUuCj4gPiA+Cj4gPiA+IC0tLSBhL2tlcm5lbC93YXRjaGRvZy5jCj4gPiA+
ICsrKyBiL2tlcm5lbC93YXRjaGRvZy5jCj4gPiA+IEBAIC04NywyOSArODcsMzQgQEAgX19zZXR1
cCgibm1pX3dhdGNoZG9nPSIsIGhhcmRsb2NrdXBfcGFuaWNfc2V0dXApOwo+ID4gPgo+ID4gPiAg
I2lmIGRlZmluZWQoQ09ORklHX0hBUkRMT0NLVVBfREVURUNUT1JfUEVSRikKPiA+ID4KPiA+ID4g
LXN0YXRpYyBERUZJTkVfUEVSX0NQVSh1bnNpZ25lZCBsb25nLCBocnRpbWVyX2ludGVycnVwdHMp
Owo+ID4gPiAtc3RhdGljIERFRklORV9QRVJfQ1BVKHVuc2lnbmVkIGxvbmcsIGhydGltZXJfaW50
ZXJydXB0c19zYXZlZCk7Cj4gPiA+ICtzdGF0aWMgREVGSU5FX1BFUl9DUFUoYXRvbWljX3QsIGhy
dGltZXJfaW50ZXJydXB0cyk7Cj4gPiA+ICtzdGF0aWMgREVGSU5FX1BFUl9DUFUoaW50LCBocnRp
bWVyX2ludGVycnVwdHNfc2F2ZWQpOwo+ID4gPiAgc3RhdGljIERFRklORV9QRVJfQ1BVKGJvb2ws
IHdhdGNoZG9nX2hhcmRsb2NrdXBfd2FybmVkKTsKPiA+ID4gIHN0YXRpYyB1bnNpZ25lZCBsb25n
IHdhdGNoZG9nX2hhcmRsb2NrdXBfYWxsX2NwdV9kdW1wZWQ7Cj4gPiA+Cj4gPiA+IC1zdGF0aWMg
Ym9vbCBpc19oYXJkbG9ja3VwKHZvaWQpCj4gPiA+ICtzdGF0aWMgYm9vbCBpc19oYXJkbG9ja3Vw
KHVuc2lnbmVkIGludCBjcHUpCj4gPiA+ICB7Cj4gPiA+IC0gICAgIHVuc2lnbmVkIGxvbmcgaHJp
bnQgPSBfX3RoaXNfY3B1X3JlYWQoaHJ0aW1lcl9pbnRlcnJ1cHRzKTsKPiA+ID4gKyAgICAgaW50
IGhyaW50ID0gYXRvbWljX3JlYWQoJnBlcl9jcHUoaHJ0aW1lcl9pbnRlcnJ1cHRzLCBjcHUpKTsK
PiA+ID4KPiA+ID4gLSAgICAgaWYgKF9fdGhpc19jcHVfcmVhZChocnRpbWVyX2ludGVycnVwdHNf
c2F2ZWQpID09IGhyaW50KQo+ID4gPiArICAgICBpZiAocGVyX2NwdShocnRpbWVyX2ludGVycnVw
dHNfc2F2ZWQsIGNwdSkgPT0gaHJpbnQpCj4gPiA+ICAgICAgICAgICAgICAgcmV0dXJuIHRydWU7
Cj4gPiA+Cj4gPiA+IC0gICAgIF9fdGhpc19jcHVfd3JpdGUoaHJ0aW1lcl9pbnRlcnJ1cHRzX3Nh
dmVkLCBocmludCk7Cj4gPiA+ICsgICAgIC8qCj4gPiA+ICsgICAgICAqIE5PVEU6IHdlIGRvbid0
IG5lZWQgYW55IGZhbmN5IGF0b21pY190IG9yIFJFQURfT05DRS9XUklURV9PTkNFCj4gPiA+ICsg
ICAgICAqIGZvciBocnRpbWVyX2ludGVycnVwdHNfc2F2ZWQuIGhydGltZXJfaW50ZXJydXB0c19z
YXZlZCBpcwo+ID4gPiArICAgICAgKiB3cml0dGVuL3JlYWQgYnkgYSBzaW5nbGUgQ1BVLgo+ID4g
PiArICAgICAgKi8KPiA+ID4gKyAgICAgcGVyX2NwdShocnRpbWVyX2ludGVycnVwdHNfc2F2ZWQs
IGNwdSkgPSBocmludDsKPiA+ID4KPiA+ID4gICAgICAgcmV0dXJuIGZhbHNlOwo+ID4gPiAgfQo+
ID4gPgo+ID4gPiAgc3RhdGljIHZvaWQgd2F0Y2hkb2dfaGFyZGxvY2t1cF9raWNrKHZvaWQpCj4g
PiA+ICB7Cj4gPiA+IC0gICAgIF9fdGhpc19jcHVfaW5jKGhydGltZXJfaW50ZXJydXB0cyk7Cj4g
PiA+ICsgICAgIGF0b21pY19pbmMocmF3X2NwdV9wdHIoJmhydGltZXJfaW50ZXJydXB0cykpOwo+
ID4KPiA+IElzIHRoZXJlIGFueSBwYXJ0aWN1bGFyIHJlYXNvbiB3aHkgcmF3XyooKSBpcyBuZWVk
ZWQsIHBsZWFzZT8KPiA+Cj4gPiBNeSBleHBlY3RhdGlvbiBpcyB0aGF0IHRoZSByYXdfIEFQSSBz
aG91bGQgYmUgdXNlZCBvbmx5IHdoZW4KPiA+IHRoZXJlIGlzIGEgZ29vZCByZWFzb24gZm9yIGl0
LiBXaGVyZSBhIGdvb2QgcmVhc29uIG1pZ2h0IGJlCj4gPiB3aGVuIHRoZSBjaGVja3MgbWlnaHQg
ZmFpbCBidXQgdGhlIGNvbnNpc3RlbmN5IGlzIGd1YXJhbnRlZWQKPiA+IGFub3RoZXIgd2F5Lgo+
ID4KPiA+IElNSE8sIHdlIHNob3VsZCB1c2U6Cj4gPgo+ID4gICAgICAgICBhdG9taWNfaW5jKHRo
aXNfY3B1X3B0cigmaHJ0aW1lcl9pbnRlcnJ1cHRzKSk7Cj4gPgo+ID4gVG8gYmUgaG9uZXN0LCBJ
IGFtIGEgYml0IGxvc3QgaW4gdGhlIHBlcl9jcHUgQVBJIGRlZmluaXRpb25zLgo+ID4KPiA+IEJ1
dCB0aGlzX2NwdV9wdHIoKSBzZWVtcyB0byBiZSBpbXBsZW1lbnRlZCB0aGUgc2FtZSB3YXkgYXMK
PiA+IHBlcl9jcHVfcHRyKCkgd2hlbiBDT05GSUdfREVCVUdfUFJFRU1QVCBpcyBlbmFibGVkLgo+
ID4gQW5kIHdlIHVzZSBwZXJfY3B1X3B0cigpIGluIGlzX2hhcmRsb2NrdXAoKS4KPiA+Cj4gPiBB
bHNvIHRoaXNfY3B1X3B0cigpIGlzIHVzZWQgbW9yZSBjb21tb25seToKPiA+Cj4gPiAkPiBnaXQg
Z3JlcCB0aGlzX2NwdV9wdHIgfCB3YyAtbAo+ID4gMTM4NQo+ID4gJD4gZ2l0IGdyZXAgcmF3X2Nw
dV9wdHIgfCB3YyAtbAo+ID4gMTE0Cj4gCj4gSG1tbSwgSSB0aGluayBtYXliZSBJIGNvbmZ1c2Vk
IG15c2VsZi4gVGhlIG9sZCBjb2RlIHB1cnBvc2VseSB1c2VkIHRoZQo+IGRvdWJsZS11bmRlcnNj
b3JlIHByZWZpeGVkIHZlcnNpb24gb2YgdGhpc19jcHVfaW5jKCkuIEkgY291bGRuJ3QgZmluZAo+
IGEgZG91YmxlLXVuZGVyc2NvcmUgdmVyc2lvbiBvZiB0aGlzX2NwdV9wdHIoKSBhbmQgSSBzb21l
aG93IGNvbnZpbmNlZAo+IG15c2VsZiB0aGF0IHRoZSByYXcoKSB2ZXJzaW9uIHdhcyB0aGUgcmln
aHQgZXF1aXZhbGVudCB2ZXJzaW9uLgo+IAo+IFlvdSdyZSByaWdodCB0aGF0IHRoaXNfY3B1X3B0
cigpIGlzIGEgYmV0dGVyIGNob2ljZSBoZXJlIGFuZCBJIGRvbid0Cj4gc2VlIGFueSByZWFzb24g
d2h5IHdlJ2QgbmVlZCB0aGUgcmF3IHZlcnNpb24uCgpJIHdhcyBjb25mdXNlZCB0b28uIEhvbmVz
dGx5LCBpdCBsb29rcyBhIGJpdCBtZXNzeSB0byBtZS4KCk15IHVuZGVyc3RhbmRpbmcgaXMgdGhh
dCB0aGlzX2NwdSooKSBBUEkgaGFzIHRoZSBmb2xsb3dpbmcgc2VtYW50aWM6CgogICAgKyB0aGlz
X2NwdV8qKCkqIGFjdGl2ZWx5IGRpc2FibGVzIGludGVycnVwdHMvcHJlZW1wdGlvbgoKICAgICsg
X190aGlzX2NwdV8qKCkganVzdCB3YXJucyB3aGVuIHRoZSB0YXNrIGNvdWxkIG1pZ3JhdGUKCQli
ZXR3ZWVuIENQVXMuCgogICAgKyByYXdfY3B1XyooKSBjYW4gYmUgdXNlZCBpbiBwcmVlbXRpYmxl
IGNvbnRleHQgd2hlbgoJCXRoZSB2YWxpZGl0eSBpcyBndWFyYW50ZWVkIGFub3RoZXIgd2F5LgoK
dGhpc19jcHVfcHRyKCkgZG9lcyBub3QgZml0IHRoZSBhYm92ZS4gSSBndWVzcyB0aGF0IGl0IGlz
CmJlY2F1c2UgaXQgaXMganVzdCBwcm92aWRpbmcgdGhlIGFkZHJlc3MgYW5kIGl0IGlzIG5vdAph
Y2Nlc3NpbmcgdGhlIGRhdGEuIFNvIGl0IGlzIGVub3VnaCB0byByZWFkIHRoZSBjdXJyZW50CkNQ
VSBpZCBhbiBhdG9taWMgd2F5LgoKSU1ITywgaXQgd291bGQgbWFrZSBzZW5zZSB0byBkaXN0aW5n
dWlzaCBob3cgdGhlIHBvaW50ZXIgaXMKZ29pbmcgdG8gYmUgdXNlZC4gRnJvbSB0aGlzIFBPViwg
X190aGlzX2NwdV9wdHIoKSBhbmQKcmF3X2NwdV9wdHIoKSB3b3VsZCBtYWtlIG1vcmUgc2Vuc2Ug
dG8gbWUuCgpCdXQgaXQgbG9va3MgdG8gbWUgdGhhdCB0aGlzX2NwdV9wdHIoKSBoYXMgdGhlIHNh
bWUgc2VtYW50aWMKYXMgcGVyX2NwdV9wdHIoKS4KCj4gTmVpdGhlciBjaGFuZ2Ugc2VlbXMgdXJn
ZW50IHRob3VnaCBib3RoIGFyZSBpbXBvcnRhbnQgdG8gZml4LCBJJ2xsCj4gd2FpdCBhIGRheSBv
ciB0d28gdG8gc2VlIGlmIHlvdSBoYXZlIGZlZWRiYWNrIG9uIGFueSBvZiB0aGUgb3RoZXIKPiBw
YXRjaGVzIGFuZCBJJ2xsIHNlbmQgYSBmaXh1cCBzZXJpZXMuCgpZdXAsIEkgYW0gZ29pbmcgdG8g
cmV2aWV3IHRoZSByZXN0LgoKQmVzdCBSZWdhcmRzLApQZXRyCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KS2dkYi1idWdyZXBvcnQgbWFpbGluZyBsaXN0
CktnZGItYnVncmVwb3J0QGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJj
ZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9rZ2RiLWJ1Z3JlcG9ydAo=
