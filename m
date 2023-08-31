Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 85F2478F08D
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 31 Aug 2023 17:46:02 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1qbjrs-0004GH-Su
	for lists+kgdb-bugreport@lfdr.de;
	Thu, 31 Aug 2023 15:46:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <mark.rutland@arm.com>) id 1qbjrr-0004G3-E4
 for kgdb-bugreport@lists.sourceforge.net;
 Thu, 31 Aug 2023 15:45:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LZow47Kex7qe5G1wo/JuFG5Y52MAGB51lS0AjEldOW8=; b=YDvANz47EMY2FBK6pgxbeabFUs
 3fn6PWmBnoBe7fk+G6ILja74XLe6GCk/xXD+7s6sF/MWRVm8qOZDVa5bLTrwpsKmIW7VMWYkuT4Oo
 3rq9ocjW36bVe1hKLZWmAE2reC1rC06+yBMp+8mawrE2kH6Av3/rR9uep05S2ZjPuaQ8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LZow47Kex7qe5G1wo/JuFG5Y52MAGB51lS0AjEldOW8=; b=IzmidFO1Sfz3C3E1v7SfCQmGr3
 Of6Rx3FUwBs+AW/lwKAZan9DVRd9KSncysoe2gWGr/yGKDNwkyStfdzFue4ZfDAg6rexL1hOtnJgn
 rKPh5IVbxmjtjHKzC2wGtR+qGHMbPwlA1ycxF781nV1jySll7iiP3GePbcxsq0kCMGOE=;
Received: from foss.arm.com ([217.140.110.172])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtp (Exim 4.95)
 id 1qbjrn-004s80-8M for kgdb-bugreport@lists.sourceforge.net;
 Thu, 31 Aug 2023 15:45:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 158B1C15;
 Thu, 31 Aug 2023 08:46:29 -0700 (PDT)
Received: from FVFF77S0Q05N.cambridge.arm.com (FVFF77S0Q05N.cambridge.arm.com
 [10.1.36.128])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CB55A3F64C;
 Thu, 31 Aug 2023 08:45:41 -0700 (PDT)
Date: Thu, 31 Aug 2023 16:45:33 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Doug Anderson <dianders@chromium.org>, Marc Zyngier <maz@kernel.org>
Message-ID: <ZPC1nUw3qKWrC85l@FVFF77S0Q05N.cambridge.arm.com>
References: <20230830191314.1618136-1-dianders@chromium.org>
 <20230830121115.v12.1.I1223c11c88937bd0cbd9b086d4ef216985797302@changeid>
 <ZPBVB_z3FTl2nBy0@FVFF77S0Q05N>
 <CAD=FV=V3-XaT_KsJXwUXVuaXfx-RfbW3ehW4JJcvWLsty_9fcA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAD=FV=V3-XaT_KsJXwUXVuaXfx-RfbW3ehW4JJcvWLsty_9fcA@mail.gmail.com>
X-Spam-Score: -2.3 (--)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Thu, Aug 31, 2023 at 08:31:37AM -0700, Doug Anderson wrote:
    > Hi, > > On Thu, Aug 31, 2023 at 1:53 AM Mark Rutland <mark.rutland@arm.com>
    wrote: > > > > On Wed, Aug 30, 2023 at 12:11:22PM -0700, [...] 
 
 Content analysis details:   (-2.3 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
                             medium trust
                             [217.140.110.172 listed in list.dnswl.org]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1qbjrn-004s80-8M
Subject: Re: [Kgdb-bugreport] [PATCH v12 1/7] irqchip/gic-v3: Enable support
 for SGIs to act as NMIs
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>, ito-yuichi@fujitsu.com,
 Lecopzer Chen <lecopzer.chen@mediatek.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 linux-kernel@vger.kernel.org, Stephane Eranian <eranian@google.com>,
 Stephen Boyd <swboyd@chromium.org>, linux-perf-users@vger.kernel.org,
 Chen-Yu Tsai <wens@csie.org>, kgdb-bugreport@lists.sourceforge.net,
 Tomohiro Misono <misono.tomohiro@fujitsu.com>,
 Thomas Gleixner <tglx@linutronix.de>, Masayoshi Mizuma <msys.mizuma@gmail.com>,
 Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

T24gVGh1LCBBdWcgMzEsIDIwMjMgYXQgMDg6MzE6MzdBTSAtMDcwMCwgRG91ZyBBbmRlcnNvbiB3
cm90ZToKPiBIaSwKPiAKPiBPbiBUaHUsIEF1ZyAzMSwgMjAyMyBhdCAxOjUz4oCvQU0gTWFyayBS
dXRsYW5kIDxtYXJrLnJ1dGxhbmRAYXJtLmNvbT4gd3JvdGU6Cj4gPgo+ID4gT24gV2VkLCBBdWcg
MzAsIDIwMjMgYXQgMTI6MTE6MjJQTSAtMDcwMCwgRG91Z2xhcyBBbmRlcnNvbiB3cm90ZToKPiA+
ID4gQXMgb2YgY29tbWl0IDZhYmJkNjk4ODk3MSAoImlycWNoaXAvZ2ljLCBnaWMtdjM6IE1ha2Ug
U0dJcyB1c2UKPiA+ID4gaGFuZGxlX3BlcmNwdV9kZXZpZF9pcnEoKSIpIFNHSXMgYXJlIHRyZWF0
ZWQgdGhlIHNhbWUgYXMgUFBJcy9FUFBJcwo+ID4gPiBhbmQgdXNlIGhhbmRsZV9wZXJjcHVfZGV2
aWRfaXJxKCkgYnkgZGVmYXVsdC4gVW5mb3J0dW5hdGVseSwKPiA+ID4gaGFuZGxlX3BlcmNwdV9k
ZXZpZF9pcnEoKSBpc24ndCBOTUkgc2FmZSwgYW5kIHNvIHRvIHJ1biBpbiBhbiBOTUkKPiA+ID4g
Y29udGV4dCB0aG9zZSBzaG91bGQgdXNlIGhhbmRsZV9wZXJjcHVfZGV2aWRfZmFzdGVvaV9ubWko
KS4KPiA+ID4KPiA+ID4gSW4gb3JkZXIgdG8gYWNjb21wbGlzaCB0aGlzLCB3ZSBqdXN0IGhhdmUg
dG8gbWFrZSByb29tIGZvciBTR0lzIGluIHRoZQo+ID4gPiBhcnJheSBvZiByZWZjb3VudHMgdGhh
dCBrZWVwcyB0cmFjayBvZiB3aGljaCBpbnRlcnJ1cHRzIGFyZSBzZXQgYXMKPiA+ID4gTk1JLiBX
ZSBhbHNvIHJlbmFtZSB0aGUgYXJyYXkgYW5kIGNyZWF0ZSBhIG5ldyBpbmRleGluZyBzY2hlbWUg
dGhhdAo+ID4gPiBhY2NvdW50cyBmb3IgU0dJcy4KPiA+ID4KPiA+ID4gQWxzbywgZW5hYmxlIE5N
SSBzdXBwb3J0IHByaW9yIHRvIGdpY19zbXBfaW5pdCgpIGFzIGFsbG9jYXRpb24gb2YgU0dJcwo+
ID4gPiBhcyBJUlFzL05NSXMgaGFwcGVuIGFzIHBhcnQgb2YgdGhpcyByb3V0aW5lLgo+ID4gPgo+
ID4gPiBDby1kZXZlbG9wZWQtYnk6IFN1bWl0IEdhcmcgPHN1bWl0LmdhcmdAbGluYXJvLm9yZz4K
PiA+ID4gU2lnbmVkLW9mZi1ieTogU3VtaXQgR2FyZyA8c3VtaXQuZ2FyZ0BsaW5hcm8ub3JnPgo+
ID4gPiBTaWduZWQtb2ZmLWJ5OiBEb3VnbGFzIEFuZGVyc29uIDxkaWFuZGVyc0BjaHJvbWl1bS5v
cmc+Cj4gPiA+IC0tLQo+ID4gPiBJJ2xsIG5vdGUgdGhhdCB0aGlzIGNoYW5nZSBpcyBhIGxpdHRs
ZSBtb3JlIGJsYWNrIG1hZ2ljIHRvIG1lIHRoYW4KPiA+ID4gb3RoZXJzIGluIHRoaXMgc2VyaWVz
LiBJIGRvbid0IGhhdmUgYSBtYXNzaXZlIGFtb3VudHMgb2YgZmFtaWxpYXJpdHkKPiA+ID4gd2l0
aCBhbGwgdGhlIG1vdmluZyBwYXJ0cyBvZiBnaWMtdjMsIHNvIEkgbW9zdGx5IGp1c3QgZm9sbG93
ZWQgTWFyawo+ID4gPiBSdXRsYW5kJ3MgYWR2aWNlIFsxXS4gUGxlYXNlIHBheSBleHRyYSBhdHRl
bnRpb24gdG8gbWFrZSBzdXJlIEkgZGlkbid0Cj4gPiA+IGRvIGFueXRoaW5nIHRvbyB0ZXJyaWJs
ZS4KPiA+ID4KPiA+ID4gTWFyaydzIGFkdmljZSB3YXNuJ3QgYSBmdWxsIHBhdGNoIGFuZCBJIGVu
ZGVkIHVwIGRvaW5nIGEgYml0IG9mIHdvcmsKPiA+ID4gdG8gdHJhbnNsYXRlIGl0IHRvIHJlYWxp
dHksIHNvIEkgZGlkIG5vdCBhZGQgaGltIGFzICJDby1kZXZlbG9wZWQtYnkiCj4gPiA+IGhlcmUu
IE1hcms6IGlmIHlvdSB3b3VsZCBsaWtlIHRoaXMgdGFnIHRoZW4gcGxlYXNlIHByb3ZpZGUgaXQg
YW5kIHlvdXIKPiA+ID4gU2lnbmVkLW9mZi1ieS4gSSBjZXJ0YWlubHkgd29uJ3Qgb2JqZWN0Lgo+
ID4KPiA+IFRoYXQncyBhbGwgcmVhc29uYWJsZSwgYW5kIEknbSBwZXJmZWN0bHkgaGFwcHkgd2l0
aG91dCBhIHRhZy4KPiA+Cj4gPiBJIGhhdmUgb25lIHRyaXZpYWwgbml0IGJlbG93LCBidXQgd2l0
aCBvciB3aXRob3V0IHRoYXQgZml4ZWQgdXA6Cj4gPgo+ID4gQWNrZWQtYnk6IE1hcmsgUnV0bGFu
ZCA8bWFyay5ydXRsYW5kQGFybS5jb20+Cj4gPgo+ID4gPgo+ID4gPiBbMV0gaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvci9aTkMtWVJRb3BPMFBhSUlvQEZWRkY3N1MwUTA1Ti5jYW1icmlkZ2UuYXJt
LmNvbQo+ID4gPgo+ID4gPiBDaGFuZ2VzIGluIHYxMjoKPiA+ID4gLSBBZGRlZCBhIGNvbW1lbnQg
YWJvdXQgd2h5IHdlIGFjY291bnQgZm9yIDE2IFNHSXMgd2hlbiBMaW51eCB1c2VzIDguCj4gPiA+
Cj4gPiA+IENoYW5nZXMgaW4gdjEwOgo+ID4gPiAtIFJld3JpdGUgYXMgbmVlZGVkIGZvciA1LjEx
KyBhcyBwZXIgTWFyayBSdXRsYW5kIGFuZCBTdW1pdC4KPiA+ID4KPiA+ID4gIGRyaXZlcnMvaXJx
Y2hpcC9pcnEtZ2ljLXYzLmMgfCA1OSArKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0t
LS0KPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCA0MSBpbnNlcnRpb25zKCspLCAxOCBkZWxldGlvbnMo
LSkKPiA+ID4KPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaXJxY2hpcC9pcnEtZ2ljLXYzLmMg
Yi9kcml2ZXJzL2lycWNoaXAvaXJxLWdpYy12My5jCj4gPiA+IGluZGV4IGVlZGZhOGU5ZjA3Ny4u
OGQyMDEyMmJhMGE4IDEwMDY0NAo+ID4gPiAtLS0gYS9kcml2ZXJzL2lycWNoaXAvaXJxLWdpYy12
My5jCj4gPiA+ICsrKyBiL2RyaXZlcnMvaXJxY2hpcC9pcnEtZ2ljLXYzLmMKPiA+ID4gQEAgLTc4
LDYgKzc4LDEzIEBAIHN0YXRpYyBERUZJTkVfU1RBVElDX0tFWV9UUlVFKHN1cHBvcnRzX2RlYWN0
aXZhdGVfa2V5KTsKPiA+ID4gICNkZWZpbmUgR0lDX0xJTkVfTlIgIG1pbihHSUNEX1RZUEVSX1NQ
SVMoZ2ljX2RhdGEucmRpc3RzLmdpY2RfdHlwZXIpLCAxMDIwVSkKPiA+ID4gICNkZWZpbmUgR0lD
X0VTUElfTlIgIEdJQ0RfVFlQRVJfRVNQSVMoZ2ljX2RhdGEucmRpc3RzLmdpY2RfdHlwZXIpCj4g
PiA+Cj4gPiA+ICsvKgo+ID4gPiArICogVGhlcmUgYXJlIDE2IFNHSXMsIHRob3VnaCB3ZSBvbmx5
IGFjdHVhbGx5IHVzZSA4IGluIExpbnV4LiBUaGUgb3RoZXIgOCBTR0lzCj4gPiA+ICsgKiBhcmUg
cG90ZW50aWFsbHkgc3RvbGVuIGJ5IHRoZSBzZWN1cmUgc2lkZS4gU29tZSBjb2RlLCBlc3BlY2lh
bGx5IGNvZGUgZGVhbGluZwo+ID4gPiArICogd2l0aCBod2lycSBJRHMsIGlzIHNpbXBsaWZpZWQg
YnkgYWNjb3VudGluZyBmb3IgYWxsIDE2Lgo+ID4gPiArICovCj4gPiA+ICsjZGVmaW5lIFNHSV9O
UiAgICAgICAgICAgICAgIDE2Cj4gPiA+ICsKPiA+ID4gIC8qCj4gPiA+ICAgKiBUaGUgYmVoYXZp
b3VycyBvZiBSUFIgYW5kIFBNUiByZWdpc3RlcnMgZGlmZmVyIGRlcGVuZGluZyBvbiB0aGUgdmFs
dWUgb2YKPiA+ID4gICAqIFNDUl9FTDMuRklRLCBhbmQgdGhlIGJlaGF2aW91ciBvZiBub24tc2Vj
dXJlIHByaW9yaXR5IHJlZ2lzdGVycyBvZiB0aGUKPiA+ID4gQEAgLTEyNSw4ICsxMzIsOCBAQCBF
WFBPUlRfU1lNQk9MKGdpY19ub25zZWN1cmVfcHJpb3JpdGllcyk7Cj4gPiA+ICAgICAgICAgICAg
ICAgX19wcmlvcml0eTsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBcCj4gPiA+ICAgICAgIH0pCj4gPiA+Cj4gPiA+IC0vKiBwcGlfbm1pX3JlZnNbbl0gPT0gbnVt
YmVyIG9mIGNwdXMgaGF2aW5nIHBwaVtuICsgMTZdIHNldCBhcyBOTUkgKi8KPiA+ID4gLXN0YXRp
YyByZWZjb3VudF90ICpwcGlfbm1pX3JlZnM7Cj4gPiA+ICsvKiByZGlzdF9ubWlfcmVmc1tuXSA9
PSBudW1iZXIgb2YgY3B1cyBoYXZpbmcgdGhlIHJkaXN0IGludGVycnVwdCBuIHNldCBhcyBOTUkg
Ki8KPiA+ID4gK3N0YXRpYyByZWZjb3VudF90ICpyZGlzdF9ubWlfcmVmczsKPiA+ID4KPiA+ID4g
IHN0YXRpYyBzdHJ1Y3QgZ2ljX2t2bV9pbmZvIGdpY192M19rdm1faW5mbyBfX2luaXRkYXRhOwo+
ID4gPiAgc3RhdGljIERFRklORV9QRVJfQ1BVKGJvb2wsIGhhc19yc3MpOwo+ID4gPiBAQCAtNTE5
LDkgKzUyNiwyMiBAQCBzdGF0aWMgdTMyIF9fZ2ljX2dldF9wcGlfaW5kZXgoaXJxX2h3X251bWJl
cl90IGh3aXJxKQo+ID4gPiAgICAgICB9Cj4gPiA+ICB9Cj4gPiA+Cj4gPiA+IC1zdGF0aWMgdTMy
IGdpY19nZXRfcHBpX2luZGV4KHN0cnVjdCBpcnFfZGF0YSAqZCkKPiA+ID4gK3N0YXRpYyB1MzIg
X19naWNfZ2V0X3JkaXN0X2lkeChpcnFfaHdfbnVtYmVyX3QgaHdpcnEpCj4gPiA+ICt7Cj4gPiA+
ICsgICAgIHN3aXRjaCAoX19nZXRfaW50aWRfcmFuZ2UoaHdpcnEpKSB7Cj4gPiA+ICsgICAgIGNh
c2UgU0dJX1JBTkdFOgo+ID4gPiArICAgICBjYXNlIFBQSV9SQU5HRToKPiA+ID4gKyAgICAgICAg
ICAgICByZXR1cm4gaHdpcnE7Cj4gPiA+ICsgICAgIGNhc2UgRVBQSV9SQU5HRToKPiA+ID4gKyAg
ICAgICAgICAgICByZXR1cm4gaHdpcnEgLSBFUFBJX0JBU0VfSU5USUQgKyAzMjsKPiA+ID4gKyAg
ICAgZGVmYXVsdDoKPiA+ID4gKyAgICAgICAgICAgICB1bnJlYWNoYWJsZSgpOwo+ID4gPiArICAg
ICB9Cj4gPiA+ICt9Cj4gPiA+ICsKPiA+ID4gK3N0YXRpYyB1MzIgZ2ljX2dldF9yZGlzdF9pZHgo
c3RydWN0IGlycV9kYXRhICpkKQo+ID4gPiAgewo+ID4gPiAtICAgICByZXR1cm4gX19naWNfZ2V0
X3BwaV9pbmRleChkLT5od2lycSk7Cj4gPiA+ICsgICAgIHJldHVybiBfX2dpY19nZXRfcmRpc3Rf
aWR4KGQtPmh3aXJxKTsKPiA+ID4gIH0KPiA+Cj4gPiBOaXQ6IEl0IHdvdWxkIGJlIG5pY2VyIHRv
IGNhbGwgdGhpcyBnaWNfZ2V0X3JkaXN0X2luZGV4KCkgdG8gbWF0Y2gKPiA+IGdpY19nZXRfcHBp
X2luZGV4KCk7IGxpa2V3aXNlIHdpdGggX19naWNfZ2V0X3JkaXN0X2luZGV4KCkuCj4gPgo+ID4g
VGhhdCdzIG15IGZhdWx0IGdpdmVuIEkgc3VnZ2VzdGVkIHRoZSBnaWNfZ2V0X3JkaXN0X2lkeCgp
IG5hbWUgaW46Cj4gPgo+ID4gICBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1hcm0ta2Vy
bmVsL1pOQy1ZUlFvcE8wUGFJSW9ARlZGRjc3UzBRMDVOLmNhbWJyaWRnZS5hcm0uY29tLwo+ID4K
PiA+IC4uLiBzbyBzb3JyeSBhYm91dCB0aGF0IQo+IAo+IFllYWgsIEkga2VwdCB0aGUgbmFtZSB5
b3Ugc3VnZ2VzdGVkIGV2ZW4gdGhvdWdoIGl0IHNlZW1lZCBhIGxpdHRsZQo+IGluY29uc2lzdGVu
dC4gSSdsbCBoYXBwaWx5IHNlbmQgYSB2MTMgd2l0aCB0aGF0IGZpeGVkIHVwLCB0aG91Z2ggSSds
bAo+IHByb2JhYmx5IHdhaXQgYSBsaXR0bGUgYml0IGp1c3QgdG8gYXZvaWQgc3BhbW1pbmcgbmV3
IHZlcnNpb25zIHRvbwo+IHF1aWNrbHkuIEl0J3Mgbm90IGxpa2UgdGhlIHBhdGNoZXMgY2FuIGxh
bmQgaW4gdGhlIG1pZGRsZSBvZiB0aGUgbWVyZ2UKPiB3aW5kb3cgYW55d2F5Lgo+IAo+IFVubGVz
cyBzb21lb25lIHNheXMgb3RoZXJ3aXNlLCBJIGd1ZXNzIHRoaXMgc2VyaWVzIGlzIGluIGdvb2Qg
c2hhcGUgdG8KPiBsYW5kIHRoZW4uIAoKSSB0aGluayBzbywgeWVzLgoKPiBEb2VzIGFueW9uZSBo
YXZlIGFueSBwbGFucyBmb3IgdGhlIGRldGFpbHMgb2YgaG93IHRvIGxhbmQgaXQ/IEkgZ3Vlc3Mg
dGhpcwo+IHdvdWxkIGJlIHNvbWV0aGluZyB0aGF0IE1hcmMsIENhdGFsaW4gYW5kIFdpbGwgd291
bGQgbmVlZCB0byBoYXNoIG91dCBzaW5jZQo+IHRoZSBmaXJzdCBwYXRjaCB3b3VsZCBpZGVhbGx5
IGdvIHRocm91Z2ggYSBkaWZmZXJlbnQgdHJlZSB0aGFuIHRoZSBvdGhlcnMuCgpJIHN1c3BlY3Qg
dGhhdCBhcyBsb25nIGFzIHRoZSBHSUMgcGF0Y2ggZG9lc24ndCBjb25mbGljdCB3aXRoIGFueXRo
aW5nIGluIHRoZQppcnFjaGlwIHRyZWUgKGFuZCBhc3N1bWluZyBNYXJjJ3MgaGFwcHkgd2l0aCBp
dCksIHdlIGNvdWxkIHJvdXRlIHRoaXMgYWxsCnRocm91Z2ggdGhlIGFybTY0IHRyZWUgYXMgdGhh
dCdzIHdoYXQgd2UgZGlkIHdoZW4gd2UgYWRkZWQgc3VwcG9ydCBmb3IKcHNldWRvLU5NSSBpbiB0
aGUgZmlyc3QgcGxhY2UuCgpNYXJjLCB0aG91Z2h0cz8KCk1hcmsuCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KS2dkYi1idWdyZXBvcnQgbWFpbGluZyBs
aXN0CktnZGItYnVncmVwb3J0QGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNv
dXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9rZ2RiLWJ1Z3JlcG9ydAo=
