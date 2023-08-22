Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B2667783A1D
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 22 Aug 2023 08:43:10 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1qYL6c-0002Bv-Jn
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 22 Aug 2023 06:43:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <mark.rutland@arm.com>) id 1qYL6T-0002BZ-Hk
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 22 Aug 2023 06:43:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lAs4coIeA6VOousoWh6RjBCsqqa8SY+nMhxEQI19L6c=; b=AJN3dqn2Epj3CZvSUSWOut7d0j
 ErUNzXW4vPKZdmSXGHXT2GFuieczyu1N0OKeuq7mdBeHhC2fKrcTSEAFXhxOa8ia0uT2SdqJa7nIi
 l6elWy+K23ydczGxZCIMiakxqzoTFIVrFAqMtWk9yw2bE1UnISWLK2IpGhXb6snzdQCM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lAs4coIeA6VOousoWh6RjBCsqqa8SY+nMhxEQI19L6c=; b=BHgP9+KLKv9uiYLDuTGEt/gNV8
 DHqDZXdKkKpxbWiZy44XEqr05uQuVRvUf5bl6f4IfuIs0UKkFtYi1di0N4Bqn/iIBSXKl0mN9PXFs
 hgSpi4RFfDUOotJJk0BrrzbYCumFciedNTI/vk/z3fVGY5g2UvWtoUqauTgTKpFZynwQ=;
Received: from foss.arm.com ([217.140.110.172])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtp (Exim 4.95)
 id 1qYL6Q-0000yB-76 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 22 Aug 2023 06:43:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 756332F4;
 Mon, 21 Aug 2023 23:43:33 -0700 (PDT)
Received: from FVFF77S0Q05N (unknown [10.57.3.221])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9C2863F740;
 Mon, 21 Aug 2023 23:42:49 -0700 (PDT)
Date: Tue, 22 Aug 2023 07:42:47 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Doug Anderson <dianders@chromium.org>
Message-ID: <ZORY51mF4alI41G1@FVFF77S0Q05N>
References: <20230601213440.2488667-1-dianders@chromium.org>
 <20230601143109.v9.3.Ie6c132b96ebbbcddbf6954b9469ed40a6960343c@changeid>
 <ZNDDgRuNGzovddaO@FVFF77S0Q05N.cambridge.arm.com>
 <CAD=FV=VVJsJSc=uQWad4x0EV2-iROFcueW_=4VbM+0N0+aD96g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAD=FV=VVJsJSc=uQWad4x0EV2-iROFcueW_=4VbM+0N0+aD96g@mail.gmail.com>
X-Spam-Score: -2.3 (--)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Mon, Aug 21, 2023 at 03:16:56PM -0700, Doug Anderson wrote:
    > Hi, > > On Mon, Aug 7, 2023 at 3:12 AM Mark Rutland <mark.rutland@arm.com>
    wrote: > > > > On Thu, Jun 01, 2023 at 02:31:47PM -0700, D [...] 
 
 Content analysis details:   (-2.3 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
                             medium trust
                             [217.140.110.172 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1qYL6Q-0000yB-76
Subject: Re: [Kgdb-bugreport] [PATCH v9 3/7] arm64: Add framework for a
 debug IPI
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Lecopzer Chen <lecopzer.chen@mediatek.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Masahiro Yamada <masahiroy@kernel.org>, ito-yuichi@fujitsu.com,
 linux-kernel@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
 linux-perf-users@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
 Marc Zyngier <maz@kernel.org>, kgdb-bugreport@lists.sourceforge.net,
 Thomas Gleixner <tglx@linutronix.de>, Masayoshi Mizuma <msys.mizuma@gmail.com>,
 Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Andrey Konovalov <andreyknvl@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

T24gTW9uLCBBdWcgMjEsIDIwMjMgYXQgMDM6MTY6NTZQTSAtMDcwMCwgRG91ZyBBbmRlcnNvbiB3
cm90ZToKPiBIaSwKPiAKPiBPbiBNb24sIEF1ZyA3LCAyMDIzIGF0IDM6MTLigK9BTSBNYXJrIFJ1
dGxhbmQgPG1hcmsucnV0bGFuZEBhcm0uY29tPiB3cm90ZToKPiA+Cj4gPiBPbiBUaHUsIEp1biAw
MSwgMjAyMyBhdCAwMjozMTo0N1BNIC0wNzAwLCBEb3VnbGFzIEFuZGVyc29uIHdyb3RlOgo+ID4g
PiBGcm9tOiBTdW1pdCBHYXJnIDxzdW1pdC5nYXJnQGxpbmFyby5vcmc+Cj4gPiA+Cj4gPiA+IElu
dHJvZHVjZSBhIGZyYW1ld29yayBmb3IgYW4gSVBJIHRoYXQgd2lsbCBiZSB1c2VkIGZvciBkZWJ1
Zwo+ID4gPiBwdXJwb3Nlcy4gVGhlIHByaW1hcnkgdXNlIGNhc2Ugb2YgdGhpcyBJUEkgd2lsbCBi
ZSB0byBnZW5lcmF0ZSBzdGFjawo+ID4gPiBjcmF3bHMgb24gb3RoZXIgQ1BVcywgYnV0IGl0IHdp
bGwgYWxzbyBiZSB1c2VkIHRvIHJvdW5kIHVwIENQVXMgZm9yCj4gPiA+IGtnZGIuCj4gPiA+Cj4g
PiA+IFdoZW4gcG9zc2libGUsIHdlIHRyeSB0byBhbGxvY2F0ZSB0aGlzIGRlYnVnIElQSSBhcyBh
biBOTUkgKG9yIGEKPiA+ID4gcHNldWRvIE5NSSkuIElmIHRoYXQgZmFpbHMgKGR1ZSB0byBDT05G
SUcsIGFuIGluY29tcGF0aWJsZSBpbnRlcnJ1cHQKPiA+ID4gY29udHJvbGxlciwgYSBxdWlyaywg
bWlzc2luZyB0aGUgImlycWNoaXAuZ2ljdjNfcHNldWRvX25taT0xIiBrZXJuZWwKPiA+ID4gcGFy
YW1ldGVyLCBldGMpIHdlIGZhbGwgYmFjayB0byBhIG5vcm1hbCBJUEkuCj4gPiA+Cj4gPiA+IE5P
VEU6IGhvb2tpbmcgdGhpcyB1cCBmb3IgQ1BVIGJhY2t0cmFjZSAvIGtnZGIgd2lsbCBoYXBwZW4g
aW4gYSBmdXR1cmUKPiA+ID4gcGF0Y2gsIHRoaXMganVzdCBhZGRzIHRoZSBmcmFtZXdvcmsuCj4g
PiA+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IFN1bWl0IEdhcmcgPHN1bWl0LmdhcmdAbGluYXJvLm9y
Zz4KPiA+ID4gU2lnbmVkLW9mZi1ieTogRG91Z2xhcyBBbmRlcnNvbiA8ZGlhbmRlcnNAY2hyb21p
dW0ub3JnPgo+ID4KPiA+IEkgdGhpbmsgdGhhdCB3ZSBzaG91bGRuJ3QgYWRkIGEgZnJhbWV3b3Jr
IGluIGEgc2VwYXJhdGUgZmlsZSBmb3IgdGhpczoKPiA+Cj4gPiAqIFRoaXMgaXMgdmVyeSBzaW1p
bGFyIHRvIG91ciBleGlzdGluZyBJUEkgbWFuYWdlbWVudCBpbiBzbXAuYywgc28gaXQgZmVlbHMK
PiA+ICAgbGlrZSBkdXBsaWNhdGlvbiwgb3IgYXQgbGVhc3QgYW5vdGhlciB0aGluZyB3ZSdkIGxp
a2UgdG8ga2VlcCBpbi1zeW5jLgo+ID4KPiA+ICogV2UncmUgZ29pbmcgdG8gd2FudCBhbiBOTUkg
YmFja3RyYWNlIHJlZ2FyZGxlc3Mgb2YgS0dEQgo+ID4KPiA+ICogV2UncmUgZ29pbmcgdG8gd2Fu
dCB0aGUgSVBJX0NQVV9TVE9QIGFuZCBJUElfQ1JBU0hfQ1BVX1NUT1AgSVBJcyB0byBiZSBOTUlz
Cj4gPiAgIHRvby4KPiA+Cj4gPiBJIHJlY2tvbiBpdCdkIGJlIGJldHRlciB0byBleHRlbmQgdGhl
IGV4aXN0aW5nIElQSSBsb2dpYyBpbiBzbXAuYyB0byBhbGxvdyBJUElzCj4gPiB0byBiZSByZXF1
ZXN0ZWQgYXMgTk1JcywgZS5nLgo+ID4KPiA+IC0tLS0KPiA+IGRpZmYgLS1naXQgYS9hcmNoL2Fy
bTY0L2tlcm5lbC9zbXAuYyBiL2FyY2gvYXJtNjQva2VybmVsL3NtcC5jCj4gPiBpbmRleCBlZGQ2
Mzg5NGQ2MWU4Li40OGU2YWE2MmM0NzNlIDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9hcm02NC9rZXJu
ZWwvc21wLmMKPiA+ICsrKyBiL2FyY2gvYXJtNjQva2VybmVsL3NtcC5jCj4gPiBAQCAtMzMsNiAr
MzMsNyBAQAo+ID4gICNpbmNsdWRlIDxsaW51eC9rZXJuZWxfc3RhdC5oPgo+ID4gICNpbmNsdWRl
IDxsaW51eC9rZXhlYy5oPgo+ID4gICNpbmNsdWRlIDxsaW51eC9rdm1faG9zdC5oPgo+ID4gKyNp
bmNsdWRlIDxsaW51eC9ubWkuaD4KPiA+Cj4gPiAgI2luY2x1ZGUgPGFzbS9hbHRlcm5hdGl2ZS5o
Pgo+ID4gICNpbmNsdWRlIDxhc20vYXRvbWljLmg+Cj4gPiBAQCAtOTI2LDYgKzkyNywyMSBAQCBz
dGF0aWMgdm9pZCBzbXBfY3Jvc3NfY2FsbChjb25zdCBzdHJ1Y3QgY3B1bWFzayAqdGFyZ2V0LCB1
bnNpZ25lZCBpbnQgaXBpbnIpCj4gPiAgICAgICAgIF9faXBpX3NlbmRfbWFzayhpcGlfZGVzY1tp
cGlucl0sIHRhcmdldCk7Cj4gPiAgfQo+ID4KPiA+ICtzdGF0aWMgYm9vbCBpcGlfc2hvdWxkX2Jl
X25taShlbnVtIGlwaV9tc2dfdHlwZSBpcGkpCj4gPiArewo+ID4gKyAgICAgICBpZiAoIXN5c3Rl
bV91c2VzX2lycV9wcmlvX21hc2tpbmcoKSkKPiA+ICsgICAgICAgICAgICAgICByZXR1cm4gZmFs
c2U7Cj4gPiArCj4gPiArICAgICAgIHN3aXRjaCAoaXBpKSB7Cj4gPiArICAgICAgIC8qCj4gPiAr
ICAgICAgICAqIFRPRE86IHNlbGVjdCBOTUkgSVBJcyBoZXJlCj4gPiArICAgICAgICAqLwo+ID4g
KyAgICAgICAgICAgICAgIHJldHVybiB0cnVlOwo+ID4gKyAgICAgICBkZWZhdWx0Ogo+ID4gKyAg
ICAgICAgICAgICAgIHJldHVybiBmYWxzZTsKPiA+ICsgICAgICAgfQo+ID4gK30KPiA+ICsKPiA+
ICBzdGF0aWMgdm9pZCBpcGlfc2V0dXAoaW50IGNwdSkKPiA+ICB7Cj4gPiAgICAgICAgIGludCBp
Owo+ID4gQEAgLTkzMyw4ICs5NDksMTQgQEAgc3RhdGljIHZvaWQgaXBpX3NldHVwKGludCBjcHUp
Cj4gPiAgICAgICAgIGlmIChXQVJOX09OX09OQ0UoIWlwaV9pcnFfYmFzZSkpCj4gPiAgICAgICAg
ICAgICAgICAgcmV0dXJuOwo+ID4KPiA+IC0gICAgICAgZm9yIChpID0gMDsgaSA8IG5yX2lwaTsg
aSsrKQo+ID4gLSAgICAgICAgICAgICAgIGVuYWJsZV9wZXJjcHVfaXJxKGlwaV9pcnFfYmFzZSAr
IGksIDApOwo+ID4gKyAgICAgICBmb3IgKGkgPSAwOyBpIDwgbnJfaXBpOyBpKyspIHsKPiA+ICsg
ICAgICAgICAgICAgICBpZiAoaXBpX3Nob3VsZF9iZV9ubWkoaSkpIHsKPiA+ICsgICAgICAgICAg
ICAgICAgICAgICAgIHByZXBhcmVfcGVyY3B1X25taShpcGlfaXJxX2Jhc2UgKyBpKTsKPiA+ICsg
ICAgICAgICAgICAgICAgICAgICAgIGVuYWJsZV9wZXJjcHVfbm1pKGlwaV9pcnFfYmFzZSArIGks
IDApOwo+ID4gKyAgICAgICAgICAgICAgIH0gZWxzZSB7Cj4gPiArICAgICAgICAgICAgICAgICAg
ICAgICBlbmFibGVfcGVyY3B1X2lycShpcGlfaXJxX2Jhc2UgKyBpLCAwKTsKPiA+ICsgICAgICAg
ICAgICAgICB9Cj4gPiArICAgICAgIH0KPiA+ICB9Cj4gPgo+ID4gICNpZmRlZiBDT05GSUdfSE9U
UExVR19DUFUKPiA+IEBAIC05NDUsOCArOTY3LDE0IEBAIHN0YXRpYyB2b2lkIGlwaV90ZWFyZG93
bihpbnQgY3B1KQo+ID4gICAgICAgICBpZiAoV0FSTl9PTl9PTkNFKCFpcGlfaXJxX2Jhc2UpKQo+
ID4gICAgICAgICAgICAgICAgIHJldHVybjsKPiA+Cj4gPiAtICAgICAgIGZvciAoaSA9IDA7IGkg
PCBucl9pcGk7IGkrKykKPiA+IC0gICAgICAgICAgICAgICBkaXNhYmxlX3BlcmNwdV9pcnEoaXBp
X2lycV9iYXNlICsgaSk7Cj4gPiArICAgICAgIGZvciAoaSA9IDA7IGkgPCBucl9pcGk7IGkrKykg
ewo+ID4gKyAgICAgICAgICAgICAgIGlmIChpcGlfc2hvdWxkX2JlX25taShpKSkgewo+ID4gKyAg
ICAgICAgICAgICAgICAgICAgICAgZGlzYWJsZV9wZXJjcHVfbm1pKGlwaV9pcnFfYmFzZSArIGkp
Owo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgdGVhcmRvd25fcGVyY3B1X25taShpcGlfaXJx
X2Jhc2UgKyBpKTsKPiA+ICsgICAgICAgICAgICAgICB9IGVsc2Ugewo+ID4gKyAgICAgICAgICAg
ICAgICAgICAgICAgZGlzYWJsZV9wZXJjcHVfaXJxKGlwaV9pcnFfYmFzZSArIGkpOwo+ID4gKyAg
ICAgICAgICAgICAgIH0KPiA+ICsgICAgICAgfQo+ID4gIH0KPiA+ICAjZW5kaWYKPiA+Cj4gPiBA
QCAtOTU4LDExICs5ODYsMTkgQEAgdm9pZCBfX2luaXQgc2V0X3NtcF9pcGlfcmFuZ2UoaW50IGlw
aV9iYXNlLCBpbnQgbikKPiA+ICAgICAgICAgbnJfaXBpID0gbWluKG4sIE5SX0lQSSk7Cj4gPgo+
ID4gICAgICAgICBmb3IgKGkgPSAwOyBpIDwgbnJfaXBpOyBpKyspIHsKPiA+IC0gICAgICAgICAg
ICAgICBpbnQgZXJyOwo+ID4gLQo+ID4gLSAgICAgICAgICAgICAgIGVyciA9IHJlcXVlc3RfcGVy
Y3B1X2lycShpcGlfYmFzZSArIGksIGlwaV9oYW5kbGVyLAo+ID4gLSAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAiSVBJIiwgJmNwdV9udW1iZXIpOwo+ID4gLSAgICAgICAg
ICAgICAgIFdBUk5fT04oZXJyKTsKPiA+ICsgICAgICAgICAgICAgICBpbnQgZXJyID0gLUVJTlZB
TDsKPiA+ICsKPiA+ICsgICAgICAgICAgICAgICBpZiAoaXBpX3Nob3VsZF9iZV9ubWkoaSkpIHsK
PiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGVyciA9IHJlcXVlc3RfcGVyY3B1X25taShpcGlf
YmFzZSArIGksIGlwaV9oYW5kbGVyLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICJJUEkiLCAmY3B1X251bWJlcik7Cj4gPiArICAgICAgICAgICAg
ICAgICAgICAgICBXQVJOKGVyciwgIkNvdWxkIG5vdCByZXF1ZXN0IElQSSAlZCBhcyBOTUksIGVy
cj0lZFxuIiwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgaSwgZXJyKTsKPiA+ICsg
ICAgICAgICAgICAgICB9IGVsc2Ugewo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgZXJyID0g
cmVxdWVzdF9wZXJjcHVfaXJxKGlwaV9iYXNlICsgaSwgaXBpX2hhbmRsZXIsCj4gPiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIklQSSIsICZjcHVfbnVt
YmVyKTsKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIFdBUk4oZXJyLCAiQ291bGQgbm90IHJl
cXVlc3QgSVBJICVkIGFzIElSUSwgZXJyPSVkXG4iLAo+ID4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBpLCBlcnIpOwo+ID4gKyAgICAgICAgICAgICAgIH0KPiA+Cj4gPiAgICAgICAgICAg
ICAgICAgaXBpX2Rlc2NbaV0gPSBpcnFfdG9fZGVzYyhpcGlfYmFzZSArIGkpOwo+ID4gICAgICAg
ICAgICAgICAgIGlycV9zZXRfc3RhdHVzX2ZsYWdzKGlwaV9iYXNlICsgaSwgSVJRX0hJRERFTik7
Cj4gPiAtLS0tCj4gPgo+ID4gLi4uIGFuZCB0aGVuIGlmIHdlIG5lZWQgYW4gSVBJIGZvciBLR0RC
LCB3ZSBjYW4gYWRkIHRoYXQgdG8gdGhlIGV4aXN0aW5nIGxpc3QKPiA+IG9mIElQSXMsIGFuZCBo
YXZlIGl0IHJlcXVlc3RlZC9lbmFibGVkL2Rpc2FibGVkIGFzIHVzdWFsLgo+IAo+IFNvdW5kcyBn
b29kLiBJJ20gc3RhcnRpbmcgdG8gd29yayBvbiB2MTAgaW5jb3Jwb3JhdGluZyB5b3VyIGZlZWRi
YWNrLgo+IEEgZmV3IHF1aWNrIHF1ZXN0aW9uczoKPiAKPiAxLiBJZiBJIG1vc3RseSB0YWtlIHlv
dXIgcGF0Y2ggYWJvdmUgdmVyYmF0aW0sIGRvIHlvdSBoYXZlIGFueQo+IHN1Z2dlc3RlZCB0YWdz
IGZvciBBdXRob3IvU2lnbmVkLW9mZi1ieT8gSSdkIHRlbmQgdG8gc2V0IHlvdSBhcyB0aGUKPiBh
dXRob3IgYnV0IEkgY2FuJ3QgZG8gdGhhdCBiZWNhdXNlIHlvdSBkaWRuJ3QgcHJvdmlkZSBhCj4g
U2lnbmVkLW9mZi1ieS4uLgoKU29ycnkgYWJvdXQgdGhhdC4gRm9yIHRoZSBhYm92ZToKClNpZ25l
ZC1vZmYtYnk6IE1hcmsgUnV0bGFuZCA8bWFyay5ydXRsYW5kQGFybS5jb20+CgpJZiBzcXVhc2hl
ZCBpbnRvIGFub3RoZXIgcGF0Y2gsIHRoZW4gZmVlbCBmcmVlIHRvIHVzZToKCkNvLWRldmVsb3Bl
ZC1ieTogTWFyayBSdXRsYW5kIDxtYXJrLnJ1dGxhbmRAYXJtLmNvbT4KCj4gMi4gV291bGQgeW91
IHByZWZlciB0aGlzIHBhdGNoIG9uIGl0cyBvd24sIG9yIHdvdWxkIHlvdSByYXRoZXIgaXQgYmUK
PiBzcXVhc2hlZCB3aXRoIHRoZSBmaXJzdCB1c2VyICgiYmFja3RyYWNlIik/IE9uIGl0cyBvd24s
IEkgdGhpbmsgSSBoYXZlCj4gdG8gZ2V0IHJpZCBvZiB0aGUgInN3aXRjaCIgc3RhdGVtZW50IGlu
IGlwaV9zaG91bGRfYmVfbm1pKCkgYW5kIGp1c3QKPiByZXR1cm4gZmFsc2U7CgpJIHJlY2tvbiBp
dCBtYWtlcyBzZW5zZSB0byBzcXVhc2ggaXQgd2l0aCB0aGUgZmlyc3QgdXNlci4KClRoYW5rcywK
TWFyay4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpL
Z2RiLWJ1Z3JlcG9ydCBtYWlsaW5nIGxpc3QKS2dkYi1idWdyZXBvcnRAbGlzdHMuc291cmNlZm9y
Z2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2tnZGIt
YnVncmVwb3J0Cg==
