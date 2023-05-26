Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A9637128EF
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 26 May 2023 16:49:57 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1q2YlQ-0005LR-2D
	for lists+kgdb-bugreport@lfdr.de;
	Fri, 26 May 2023 14:49:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pmladek@suse.com>) id 1q2Yg0-0004bV-3A
 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 26 May 2023 14:44:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fcZ4ZRR0yos18sY7hIGTBFkGlmXiSRFOxBcjHXBe5hU=; b=fDmaICwzLWvS6yRfn81tSzHLtI
 cHrjELxBehAPygTwcx/I86QDuzVxRe+HW+oIhvJwxYx3PualNJlFTjj3PppmGasK460v0JJlQIWf7
 W2+feBtsIcFmFCm7omDvwUfE+w7nz1PoAZPmu1Tlt/nRpMEUdSwLDrTZWjuQmjVfRGXA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fcZ4ZRR0yos18sY7hIGTBFkGlmXiSRFOxBcjHXBe5hU=; b=aG5+H51v93DKPDg7ZJxtArTpCB
 6FxlvAHgXH0HJDTORTxm0u14LD39WBlXE9lox2Whv4EedBy9BwjJOnpptfsFT8zjVogEM0E6eMlFa
 X9CrhsEtVUFdm3tIcAZW9BmA8wrKXTY6+/h6ZmusLTaCLtCCirfn/duyuvLCz7i9SR6M=;
Received: from smtp-out1.suse.de ([195.135.220.28])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1q2Yft-0005fz-GN for kgdb-bugreport@lists.sourceforge.net;
 Fri, 26 May 2023 14:44:20 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 1960C21AC4;
 Fri, 26 May 2023 14:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1685112247; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fcZ4ZRR0yos18sY7hIGTBFkGlmXiSRFOxBcjHXBe5hU=;
 b=J4h09ub7B+8cW6XM+zzyKpToCRFhpDx/CNcNoZrZzAVQoYGEBCP2s6MJYbAJEkhjqQwr6+
 Ii2jyonq6j1wgE1F5cWTup3ltYGq2aZa7w8gMRcHYrnG3oXEpMwdEygPcGHtjblnr0n9bd
 xIplkFCoy2RpRD5gkrV4W7dOAktOra8=
Received: from suse.cz (unknown [10.100.208.146])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 151282C141;
 Fri, 26 May 2023 14:44:04 +0000 (UTC)
Date: Fri, 26 May 2023 16:44:03 +0200
To: Doug Anderson <dianders@chromium.org>
Message-ID: <ZHDFs-7al6bbOi63@alley>
References: <20230519101840.v5.18.Ia44852044cdcb074f387e80df6b45e892965d4a1@changeid>
 <20230519101840.v5.13.I847d9ec852449350997ba00401d2462a9cb4302b@changeid>
 <ZG4YMyifGLOBJxLo@alley>
 <CAD=FV=X+LEcSrArV+w35MX4oP1sC9KoRM0puJLT1RFmyS84Hxw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAD=FV=X+LEcSrArV+w35MX4oP1sC9KoRM0puJLT1RFmyS84Hxw@mail.gmail.com>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Wed 2023-05-24 12:38:49, Doug Anderson wrote: > Hi, > >
    On Wed, May 24, 2023 at 6:59 AM Petr Mladek <pmladek@suse.com> wrote: >
    > > > On Fri 2023-05-19 10:18:37, Douglas Anderson wrote: > > > The [...]
    
 
 Content analysis details:   (-2.5 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
                             medium trust
                             [195.135.220.28 listed in list.dnswl.org]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1q2Yft-0005fz-GN
Subject: Re: [Kgdb-bugreport] [PATCH v5 13/18] watchdog/hardlockup: Have the
 perf hardlockup use __weak functions more cleanly
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

T24gV2VkIDIwMjMtMDUtMjQgMTI6Mzg6NDksIERvdWcgQW5kZXJzb24gd3JvdGU6Cj4gSGksCj4g
Cj4gT24gV2VkLCBNYXkgMjQsIDIwMjMgYXQgNjo1OeKAr0FNIFBldHIgTWxhZGVrIDxwbWxhZGVr
QHN1c2UuY29tPiB3cm90ZToKPiA+Cj4gPiBPbiBGcmkgMjAyMy0wNS0xOSAxMDoxODozNywgRG91
Z2xhcyBBbmRlcnNvbiB3cm90ZToKPiA+ID4gVGhlIGZhY3QgdGhhdCB0aGVyZSB3YXRjaGRvZ19o
YXJkbG9ja3VwX2VuYWJsZSgpLAo+ID4gPiB3YXRjaGRvZ19oYXJkbG9ja3VwX2Rpc2FibGUoKSwg
YW5kIHdhdGNoZG9nX2hhcmRsb2NrdXBfcHJvYmUoKSBhcmUKPiA+ID4gZGVjbGFyZWQgX193ZWFr
IG1lYW5zIHRoYXQgdGhlIGNvbmZpZ3VyZWQgaGFyZGxvY2t1cCBkZXRlY3RvciBjYW4KPiA+ID4g
ZGVmaW5lIG5vbi13ZWFrIHZlcnNpb25zIG9mIHRob3NlIGZ1bmN0aW9ucyBpZiBpdCBuZWVkcyB0
by4gSW5zdGVhZCBvZgo+ID4gPiBkb2luZyB0aGlzLCB0aGUgcGVyZiBoYXJkbG9ja3VwIGRldGVj
dG9yIGhvb2tlZCBpdHNlbGYgaW50byB0aGUKPiA+ID4gZGVmYXVsdCBfX3dlYWsgaW1wbGVtZW50
YXRpb24sIHdoaWNoIHdhcyBhIGJpdCBhd2t3YXJkLiBDbGVhbiB0aGlzIHVwLgo+ID4gPgo+ID4g
PiA+RnJvbSBjb21tZW50cywgaXQgbG9va3MgYXMgaWYgdGhlIG9yaWdpbmFsIGRlc2lnbiB3YXMg
ZG9uZSBiZWNhdXNlIHRoZQo+ID4gPiBfX3dlYWsgZnVuY3Rpb24gd2VyZSBleHBlY3RlZCB0byBp
bXBsZW1lbnRlZCBieSB0aGUgYXJjaGl0ZWN0dXJlIGFuZAo+ID4gPiBub3QgYnkgdGhlIGNvbmZp
Z3VyZWQgaGFyZGxvY2t1cCBkZXRlY3Rvci4gVGhpcyBnb3QgYXdrd2FyZCB3aGVuIHdlCj4gPiA+
IHRyaWVkIHRvIGFkZCB0aGUgYnVkZHkgbG9ja3VwIGRldGVjdG9yIHdoaWNoIHdhcyBub3QgYXJj
aC1zcGVjaWZpYyBidXQKPiA+ID4gd2FudGVkIHRvIGhvb2sgaW50byB0aG9zZSBzYW1lIGZ1bmN0
aW9ucy4KPiA+ID4KPiA+ID4gVGhpcyBpcyBub3QgZXhwZWN0ZWQgdG8gaGF2ZSBhbnkgZnVuY3Rp
b25hbCBpbXBhY3QuCj4gPiA+Cj4gPiA+IEBAIC0xODcsMjcgKzE4NywzMyBAQCBzdGF0aWMgaW5s
aW5lIHZvaWQgd2F0Y2hkb2dfaGFyZGxvY2t1cF9raWNrKHZvaWQpIHsgfQo+ID4gPiAgI2VuZGlm
IC8qICFDT05GSUdfSEFSRExPQ0tVUF9ERVRFQ1RPUl9QRVJGICovCj4gPiA+Cj4gPiA+ICAvKgo+
ID4gPiAtICogVGhlc2UgZnVuY3Rpb25zIGNhbiBiZSBvdmVycmlkZGVuIGlmIGFuIGFyY2hpdGVj
dHVyZSBpbXBsZW1lbnRzIGl0cwo+ID4gPiAtICogb3duIGhhcmRsb2NrdXAgZGV0ZWN0b3IuCj4g
PiA+ICsgKiBUaGVzZSBmdW5jdGlvbnMgY2FuIGJlIG92ZXJyaWRkZW4gYmFzZWQgb24gdGhlIGNv
bmZpZ3VyZWQgaGFyZGxvY2tkdXAgZGV0ZWN0b3IuCj4gPiA+ICAgKgo+ID4gPiAgICogd2F0Y2hk
b2dfaGFyZGxvY2t1cF9lbmFibGUvZGlzYWJsZSBjYW4gYmUgaW1wbGVtZW50ZWQgdG8gc3RhcnQg
YW5kIHN0b3Agd2hlbgo+ID4gPiAtICogc29mdGxvY2t1cCB3YXRjaGRvZyBzdGFydCBhbmQgc3Rv
cC4gVGhlIGFyY2ggbXVzdCBzZWxlY3QgdGhlCj4gPiA+ICsgKiBzb2Z0bG9ja3VwIHdhdGNoZG9n
IHN0YXJ0IGFuZCBzdG9wLiBUaGUgZGV0ZWN0b3IgbXVzdCBzZWxlY3QgdGhlCj4gPiA+ICAgKiBT
T0ZUTE9DS1VQX0RFVEVDVE9SIEtjb25maWcuCj4gPiA+ICAgKi8KPiA+ID4gLXZvaWQgX193ZWFr
IHdhdGNoZG9nX2hhcmRsb2NrdXBfZW5hYmxlKHVuc2lnbmVkIGludCBjcHUpCj4gPiA+IC17Cj4g
PiA+IC0gICAgIGhhcmRsb2NrdXBfZGV0ZWN0b3JfcGVyZl9lbmFibGUoKTsKPiA+ID4gLX0KPiA+
ID4gK3ZvaWQgX193ZWFrIHdhdGNoZG9nX2hhcmRsb2NrdXBfZW5hYmxlKHVuc2lnbmVkIGludCBj
cHUpIHsgfQo+ID4gPgo+ID4gPiAtdm9pZCBfX3dlYWsgd2F0Y2hkb2dfaGFyZGxvY2t1cF9kaXNh
YmxlKHVuc2lnbmVkIGludCBjcHUpCj4gPiA+IC17Cj4gPiA+IC0gICAgIGhhcmRsb2NrdXBfZGV0
ZWN0b3JfcGVyZl9kaXNhYmxlKCk7Cj4gPiA+IC19Cj4gPiA+ICt2b2lkIF9fd2VhayB3YXRjaGRv
Z19oYXJkbG9ja3VwX2Rpc2FibGUodW5zaWduZWQgaW50IGNwdSkgeyB9Cj4gPiA+Cj4gPiA+ICAv
KiBSZXR1cm4gMCwgaWYgYSBoYXJkbG9ja3VwIHdhdGNoZG9nIGlzIGF2YWlsYWJsZS4gRXJyb3Ig
Y29kZSBvdGhlcndpc2UgKi8KPiA+ID4gIGludCBfX3dlYWsgX19pbml0IHdhdGNoZG9nX2hhcmRs
b2NrdXBfcHJvYmUodm9pZCkKPiA+ID4gIHsKPiA+ID4gLSAgICAgcmV0dXJuIGhhcmRsb2NrdXBf
ZGV0ZWN0b3JfcGVyZl9pbml0KCk7Cj4gPiA+ICsgICAgIC8qCj4gPiA+ICsgICAgICAqIElmIENP
TkZJR19IQVZFX05NSV9XQVRDSERPRyBpcyBkZWZpbmVkIHRoZW4gYW4gYXJjaGl0ZWN0dXJlCj4g
PiA+ICsgICAgICAqIGlzIGFzc3VtZWQgdG8gaGF2ZSB0aGUgaGFyZCB3YXRjaGRvZyBhdmFpbGFi
bGUgYW5kIHdlIHJldHVybiAwLgo+ID4gPiArICAgICAgKi8KPiA+ID4gKyAgICAgaWYgKElTX0VO
QUJMRUQoQ09ORklHX0hBVkVfTk1JX1dBVENIRE9HKSkKPiA+ID4gKyAgICAgICAgICAgICByZXR1
cm4gMDsKPiA+ID4gKwo+ID4gPiArICAgICAvKgo+ID4gPiArICAgICAgKiBIYXJkbG9ja3VwIGRl
dGVjdG9ycyBvdGhlciB0aGFuIHRob3NlIHVzaW5nIENPTkZJR19IQVZFX05NSV9XQVRDSERPRwo+
ID4gPiArICAgICAgKiBhcmUgcmVxdWlyZWQgdG8gaW1wbGVtZW50IGEgbm9uLXdlYWsgdmVyc2lv
biBvZiB0aGlzIHByb2JlIGZ1bmN0aW9uCj4gPiA+ICsgICAgICAqIHRvIHRlbGwgd2hldGhlciB0
aGV5IGFyZSBhdmFpbGFibGUuIElmIHRoZXkgZG9uJ3Qgb3ZlcnJpZGUgdGhlbgo+ID4gPiArICAg
ICAgKiB3ZSdsbCByZXR1cm4gLUVOT0RFVi4KPiA+ID4gKyAgICAgICovCj4gPiA+ICsgICAgIHJl
dHVybiAtRU5PREVWOwo+ID4gPiAgfQo+ID4KPiA+IFdoZW4gdGhpbmtpbmcgbW9yZSBhYm91dCBp
dC4gSXQgaXMgd2VpcmQgdGhhdCB3ZSBuZWVkIHRvIGhhbmRsZQo+ID4gQ09ORklHX0hBVkVfTk1J
X1dBVENIRE9HIGluIHRoaXMgZGVmYXVsdCB3ZWVrIGZ1bmN0aW9uLgo+ID4KPiA+IEl0IHNob3Vs
ZCBiZSBoYW5kbGVkIGluIHdhdGNoZG9nX2hhcmRsb2NrdXBfcHJvYmUoKSBpbXBsZW1lbnRlZAo+
ID4gaW4ga2VybmVsL3dhdGNoZG9nX3BlcmYuYy4KPiA+Cj4gPiBJTUhPLCB0aGUgZGVmYXVsdCBf
X3dlYWsgZnVuY3Rpb24gY291bGQgYWx3YXlzIHJldHVybiAtRU5PREVWOwo+ID4KPiA+IFdvdWxk
IGl0IG1ha2Ugc2Vuc2UsIHBsZWFzZT8KPiAKPiBJIGRvbid0IHF1aXRlIHVuZGVyc3RhbmQuIEkn
ZCBhZ3JlZSB0aGF0IHRoZSBzcGVjaWFsIGNhc2UgZm9yCj4gQ09ORklHX0hBVkVfTk1JX1dBVENI
RE9HIGlzIHVnbHksIGJ1dCBpdCB3YXMgYWxzbyB1Z2x5IGJlZm9yZS4gSU1PCj4gaXQncyBhY3R1
YWxseSBhIGxpdHRsZSBsZXNzIHVnbHkgLyBlYXNpZXIgdG8gdW5kZXJzdGFuZCBhZnRlciBteQo+
IHBhdGNoLiAuLi5idXQgbGV0IG1lIHdhbGsgdGhyb3VnaCBob3cgSSB0aGluayB0aGlzIHNwZWNp
YWwgY2FzZSB3b3Jrcwo+IGFuZCBtYXliZSB5b3UgY2FuIHRlbGwgbWUgd2hlcmUgSSdtIGNvbmZ1
c2VkLgo+IAo+IFRoZSBmaXJzdCB0aGluZyB0byB1bmRlcnN0YW5kIGlzIHRoYXQgQ09ORklHX0hB
UkRMT0NLVVBfREVURUNUT1JfUEVSRgo+IGFuZCBDT05GSUdfSEFWRV9OTUlfV0FUQ0hET0cgYXJl
IG11dHVhbGx5IGV4Y2x1c2l2ZSBmcm9tIGVhY2ggb3RoZXIuCj4gVGhpcyB3YXMgdHJ1ZSBiZWZv
cmUgYW55IG9mIG15IHBhdGNoZXMgYW5kIGlzIHN0aWxsIHRydWUgYWZ0ZXIgdGhlbS4KPiBTcGVj
aWZpY2FsbHksIGlmIENPTkZJR19IQVZFX05NSV9XQVRDSERPRyBpcyBkZWZpbmVkIHRoZW4gYW4K
PiBhcmNoaXRlY3R1cmUgaW1wbGVtZW50cyBhcmNoX3RvdWNoX25taV93YXRjaGRvZygpIChhcyBk
b2N1bWVudGVkIGluCj4gdGhlIEtjb25maWcgZG9jcyBmb3IgSEFWRV9OTUlfV0FUQ0hET0cpLiBM
b29raW5nIGF0IHRoZSB0cmVlIGJlZm9yZSBteQo+IHNlcmllcyB5b3UgY2FuIHNlZSB0aGF0IHRo
ZSBwZXJmIGhhcmRsb2NrdXAgZGV0ZWN0b3IgYWxzbyBpbXBsZW1lbnRlZAo+IGFyY2hfdG91Y2hf
bm1pX3dhdGNoZG9nKCkuIFRoaXMgd291bGQgaGF2ZSBjYXVzZWQgYSBjb25mbGljdC4gVGhlCj4g
bXV0dWFsIGV4Y2x1c2lvbiB3YXMgcHJlc3VtYWJseSBlbmZvcmNlZCBieSBhbiBhcmNoaXRlY3R1
cmUgbm90Cj4gZGVmaW5pbmcgYm90aCBIQVZFX05NSV9XQVRDSERPRyBhbmQgSEFWRV9IQVJETE9D
S1VQX0RFVEVDVE9SX1BFUkYuCj4gCj4gVGhlIHNlY29uZCB0aGluZyB0byB1bmRlcnN0YW5kIGlz
IHRoYXQgYW4gYXJjaGl0ZWN0dXJlIHRoYXQgZGVmaW5lcwo+IENPTkZJR19IQVZFX05NSV9XQVRD
SERPRyBpcyBfbm90XyByZXF1aXJlZCB0byBpbXBsZW1lbnQKPiB3YXRjaGRvZ19oYXJkbG9ja3Vw
X3Byb2JlKCkgKHVzZWQgdG8gYmUgY2FsbGVkIHdhdGNoZG9nX25taV9wcm9iZSgpKS4KPiBNYXli
ZSB0aGlzIHNob3VsZCBjaGFuZ2UsIGJ1dCBhdCB0aGUgdmVyeSBsZWFzdCBpdCBhcHBlYXJzIHRo
YXQKPiBTUEFSQzY0IGRlZmluZXMgSEFWRV9OTUlfV0FUQ0hET0cgYnV0IGRvZXNuJ3QgZGVmaW5l
Cj4gd2F0Y2hkb2dfaGFyZGxvY2t1cF9wcm9iZSgpIEFLQSB3YXRjaGRvZ19ubWlfcHJvYmUoKS4g
QW55b25lIHdobwo+IGRlZmluZXMgQ09ORklHX0hBVkVfTk1JX1dBVENIRE9HIGFuZCBkb2Vzbid0
IGltcGxlbWVudAo+IHdhdGNoZG9nX2hhcmRsb2NrdXBfcHJvYmUoKSBpcyBjbGFpbWluZyB0aGF0
IHRoZWlyIHdhdGNoZG9nIG5lZWRzIG5vCj4gcHJvYmluZyBhbmQgaXMgYWx3YXlzIGF2YWlsYWJs
ZS4KPiAKPiBTbyB3aXRoIHRoYXQgY29udGV4dDoKPiAKPiAxLiBXZSBjYW4ndCBoYW5kbGUgYW55
IHNwZWNpYWwgY2FzZXMgZm9yIENPTkZJR19IQVZFX05NSV9XQVRDSERPRyBpbgo+ICJrZXJuZWwv
d2F0Y2hkb2dfcGVyZi5jIi4gVGhlIHNwZWNpYWwgY2FzZXMgdGhhdCB3ZSBuZWVkIHRvIGhhbmRs
ZSBhcmUKPiBhbGwgZm9yIHRoZSBjYXNlcyB3aGVyZSBDT05GSUdfSEFSRExPQ0tVUF9ERVRFQ1RP
Ul9QRVJGIGlzbid0IGRlZmluZWQKPiBhbmQgdGhhdCBtZWFucyAia2VybmVsL3dhdGNoZG9nX3Bl
cmYuYyIgaXNuJ3QgaW5jbHVkZWQuCj4gCj4gMi4gV2UgY2FuJ3QgaGF2ZSB0aGUgZGVmYXVsdCBf
X3dlYWsgZnVuY3Rpb24gcmV0dXJuIC1FTk9ERVYgYmVjYXVzZQo+IENPTkZJR19IQVZFX05NSV9X
QVRDSERPRyBkb2Vzbid0IHJlcXVpcmUgYW4gYXJjaCB0byBpbXBsZW1lbnQKPiB3YXRjaGRvZ19o
YXJkbG9ja3VwX3Byb2JlKCksIGJ1dCB3ZSB3YW50IHdhdGNoZG9nX2hhcmRsb2NrdXBfcHJvYmUo
KQo+IHRvIHJldHVybiAibm8gZXJyb3IiIGluIHRoYXQgY2FzZSBzbyB0aGF0Cj4gIndhdGNoZG9n
X2hhcmRsb2NrdXBfYXZhaWxhYmxlIiBnZXRzIHNldCB0byB0cnVlLgo+IAo+IERvZXMgdGhhdCBz
b3VuZCByaWdodD8KPiAKPiBJJ2QgYWdyZWUgdGhhdCBhIGZ1dHVyZSBpbXByb3ZlbWVudCBzYXlp
bmcgdGhhdAo+IENPTkZJR19IQVZFX05NSV9XQVRDSERPRyBtZWFucyB5b3UgX211c3RfIGltcGxl
bWVudAo+IHdhdGNoZG9nX2hhcmRsb2NrdXBfcHJvYmUoKSB3b3VsZCBtYWtlIHNlbnNlIGFuZCB0
aGF0IHdvdWxkIGFsbG93IHVzCj4gdG8gZ2V0IHJpZCBvZiB0aGUgc3BlY2lhbCBjYXNlLiBJTU8s
IHRob3VnaCwgdGhhdCdzIGEgc2VwYXJhdGUgcGF0Y2guCj4gSSdkIGJlIGhhcHB5IHRvIHJldmll
dyB0aGF0IHBhdGNoIGlmIHlvdSB3YW50ZWQgdG8gcG9zdCBpdCB1cC4gOi0pCj4gCj4gSWYgd2Ug
d2FudCB0byBhZGQgdGhhdCByZXF1aXJlbWVudCwgSSBfdGhpbmtfIHRoZSBvbmx5IHRoaW5nIHlv
dSdkCj4gbmVlZCB0byBkbyBpcyB0byBhZGQgd2F0Y2hkb2dfaGFyZGxvY2t1cF9wcm9iZSgpIHRv
IHNwYXJjNjQgYW5kIGhhdmUKPiBpdCByZXR1cm4gMCBhbmQgcHV0IHRoYXQgZGVmaW5pdGlvbiBp
biB0aGUgc2FtZSBmaWxlIGNvbnRhaW5pbmcKPiBhcmNoX3RvdWNoX25taV93YXRjaGRvZygpLgoK
VGhpcyBpcyBteSB1bmRlcnN0YW5kaW5nLiBJTUhPLCBpZiB3ZSBkZWZpbmUKd2F0Y2hkb2dfaGFy
ZGxvY2t1cF9wcm9iZSgpIGluIC9hcmNoL3NwYXJjL2tlcm5lbC9ubWkuYwp0aGVuIHdlIGNvdWxk
IHJlbW92ZSB0aGUgQ09ORklHX0hBVkVfTk1JX1dBVENIRE9HIGNoZWNrIGZyb20KdGhlIGRlZmF1
bHQgd2F0Y2hkb2dfaGFyZGxvY2t1cF9wcm9iZSgpLgoKSG9uZXN0bHksIEkgYW0gYWZyYWlkIHRo
YXQgbm9ib2R5IHJlYWxseSB0aG91Z2h0IGFib3V0IGFueSBydWxlcy4KUGVvcGxlIHdlcmUganVz
dCBhZGRpbmcgdGhlaXIgc3R1ZmYgYW55IHdheSB0aGF0IHdvcmtlZCBmb3IgdGhlbS4KQW5kIHRo
aXMgaXMgd2h5IHdlIGVuZGVkIHdpdGggdGhpcyBtYXplLgoKSXQgaXMgbm90IHlvdXIgZmF1bHQu
IFlvdSBqdXN0IG1vdmVkIHRoZSBpZmRlZiBmcm9tIHRoZSBoZWFkZXIgZmlsZQppbnRvIHRoZSBm
dW5jdGlvbiBkZWZpbml0aW9uLiBCdXQgaXQgc2hvd2VkIHZlcnkgd2VsbCBob3cgdWdseSBpdCB3
YXMuCgpCeSB1Z2x5LCBJIG1lYW4gdGhhdCBwb3dlcnBjLCBwZXJmLCBhbmQgYnVkZHkgaGFyZGxv
Y2t1cCBkZXRlY3RvcnMKbWFrZSB3YXRjaGRvZ19oYXJkbG9ja3VwX3Byb2JlKCkgc3VjY2Vzc2Z1
bCBieSBpbXBsZW1lbnRpbmcKYW4gYWx0ZXJuYXRpdmUgdG8gdGhlIGRlZmF1bHQgd2VhayBpbXBs
ZW1lbnRhdGlvbi4gT25seSwgc3BhcmM2NApyZXBvcnRzIHN1Y2Nlc3MgdmlhIGEgY3JhenkgY2hl
Y2sgaW4gdGhlIGRlZmF1bHQgd2VhayBjb25maWd1cmF0aW9uLgoKVGhlIGNoZWNrIGlzIGNyYXp5
IGJlY2F1c2UgaXQgbWFrZXMgdGhlIGRlY2lzaW9uIGJhc2VkIG9uCkNPTkZJR19IQVZFX05NSV9X
QVRDSERPRy4gQnV0IHRoZSByZWxhdGVkIGNvZGUgaXMgaW4KYXJjaC9zcGFyYy9rZXJuZWwvbm1p
LmMgd2hpY2ggaXMgY29tcGlsZWQgd2hlbiBDT05GSUdfU1BBUkM2NAppcyBlbmFibGVkLgoKVGhl
IGNvbm5lY3Rpb24gYmV0d2VlbiBDT05GSUdfSEFWRV9OTUlfV0FUQ0hET0cgYW5kCkNPTkZJR19T
UEFSQzY0IGlzIGhpZGRlbiBpbiBhcmNoL3NwYXJjL0tjb25maWcuCgpJdCB3b3VsZCBiZSBtdWNo
IG1vcmUgc3RyYWlnaHRmb3J3YXJkIHdoZW4gdGhlIHdlYWsgZnVuY3Rpb24KaXMgaW1wbGVtZW50
ZWQgaW4gYXJjaC9zcGFyYy9rZXJuZWwvbm1pLmMuIEl0IHdpbGwgYmUgY2xlYXIKdGhhdCBwcm9i
ZSgpIHdpbGwgc3VjY2VlZCB3aGVuIHRoZSB3YXRjaGRvZyBnZXRzIGluaXRpYWxpemVkLgoKCj4g
cG93ZXJwYyBhbHNvIGdldHMgQ09ORklHX0hBVkVfTk1JX1dBVENIRE9HCj4gYXMgYSBzaWRlIGVm
ZmVjdCBvZiBzZWxlY3RpbmcgQ09ORklHX0hBVkVfSEFSRExPQ0tVUF9ERVRFQ1RPUl9BUkNIIGJ1
dAo+IGl0IGxvb2tzIGxpa2UgdGhleSBpbXBsZW1lbnQgd2F0Y2hkb2dfaGFyZGxvY2t1cF9wcm9i
ZSgpIGFscmVhZHkuIE9oLAo+IGJ1dCBtYXliZSB0aGlzIHdpbGwgZml4IGEgcHJlZXhpc3Rpbmcg
KGV4aXN0ZWQgYmVmb3JlIG15IHBhdGNoZXMpCj4gbWlub3IgYnVnLi4uIFVubGVzcyBJJ20gbWlz
c2luZyBzb21ldGhpbmcgKGVudGlyZWx5IHBvc3NpYmxlISkgb24KPiBwb3dlcnBjIHRvZGF5IEkg
Z3Vlc3MgaWYgeW91IHR1cm4gb2ZmIENPTkZJR19QUENfV0FUQ0hET0cgdGhlbgo+IENPTkZJR19I
QVZFX0hBUkRMT0NLVVBfREVURUNUT1JfQVJDSCBhbmQgQ09ORklHX0hBVkVfTk1JX1dBVENIRE9H
Cj4gd291bGQgc3RpbGwgYmUgZGVmaW5lZCBhbmQgd2UnZCBlbmQgdXAgcmV0dXJuaW5nIDAgKG5v
IGVycm9yKSBmcm9tCj4gd2F0Y2hkb2dfaGFyZGxvY2t1cF9wcm9iZSgpLiBUaGF0IG1lYW5zIHRo
YXQgb24gcG93ZXJwYyB0b2RheSBpZiB5b3UKPiB0dXJuIG9mZiBDT05GSUdfUFBDX1dBVENIRE9H
IHRoYXQgJy9wcm9jL3N5cy9rZXJuZWwvbm1pX3dhdGNoZG9nJyB3aWxsCj4gc3RpbGwgdGhpbmsg
dGhlIHdhdGNoZG9nIGlzIGVuYWJsZWQ/CgpZZWFoLCBpdCBzZWVtcyB0aGF0IHRoaXMgYnVnIHdh
cyB0aGVyZS4gQW5kIGl0IHdpbGwgZ2V0IGZpeGVkIHdoZW4KdGhlIGRlZmF1bHQgd2VhayBpbXBs
ZW1lbnRhdGlvbiBvZiB3YXRjaGRvZ19oYXJkbG9ja3VwX3Byb2JlKCkKYWx3YXlzIHJldHVybnMg
ZmFsc2UuCgpBZ2FpbiwgSSdsbCBsZXQgQW5kcmV3IHRvIGRlY2lkZSB3aGV0aGVyIHRoaXMgc2hv
dWxkIGdldCBjbGVhbmVkCmluIHRoaXMgcGF0Y2hzZXQgb3IgbGF0ZXIuIEJ1dCBpdCB3b3VsZCBi
ZSBmaW5lIHRvIGZpeCB0aGlzCmFmdGVyIHdlIHNwZW50IHNvIG11Y2ggdGltZSB1bmRlcnN0YW5k
aW5nIHRoZSBtZXNzLgoKQmVzdCBSZWdhcmRzLApQZXRyCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KS2dkYi1idWdyZXBvcnQgbWFpbGluZyBsaXN0Cktn
ZGItYnVncmVwb3J0QGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZv
cmdlLm5ldC9saXN0cy9saXN0aW5mby9rZ2RiLWJ1Z3JlcG9ydAo=
