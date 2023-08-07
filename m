Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4411D772815
	for <lists+kgdb-bugreport@lfdr.de>; Mon,  7 Aug 2023 16:44:06 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1qT1Sm-0006kS-Lk
	for lists+kgdb-bugreport@lfdr.de;
	Mon, 07 Aug 2023 14:44:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <mark.rutland@arm.com>) id 1qT1Sk-0006kM-W5
 for kgdb-bugreport@lists.sourceforge.net;
 Mon, 07 Aug 2023 14:44:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5O8vR/1i2pTaOS1dFRpBW/IxDy7VOIWd34DMjXV3TwY=; b=XIVyc5ADTT5vFwGkhab7l7IQUQ
 KZy3igeJIOwf3XJVbyd0GPUAqCt6kBVArcxL2JGsq9Jx0RjZ1qMMJ227A6KwNCxU2GoxMEaKCcCJy
 34MiJR+7H3Q2wmGMvu9b7zqNfKsKdATlwkY87ENiWzfRKPLteq67ZL+BJGIPG36owrQY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5O8vR/1i2pTaOS1dFRpBW/IxDy7VOIWd34DMjXV3TwY=; b=CqetcEx0/1u841B9knN2+M+/Db
 vIz++1/R/nHwgBH818AP5TfOS/SllPIXM+SlQIJCU7wX58SuGWrh7svX9tINPqFvrGRKVPfC5lenZ
 uip0p9FRJt3Xo8vmn1wCctKo5FBSf5u2jKUojwir2861TGamw7hlPcu9WWCNhCdJAVRc=;
Received: from foss.arm.com ([217.140.110.172])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtp (Exim 4.95)
 id 1qT1Sj-00GAVn-QZ for kgdb-bugreport@lists.sourceforge.net;
 Mon, 07 Aug 2023 14:44:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5C37B1FB;
 Mon,  7 Aug 2023 07:44:38 -0700 (PDT)
Received: from FVFF77S0Q05N.cambridge.arm.com (FVFF77S0Q05N.cambridge.arm.com
 [10.1.32.139])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 74E703F64C;
 Mon,  7 Aug 2023 07:43:51 -0700 (PDT)
Date: Mon, 7 Aug 2023 15:43:46 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Sumit Garg <sumit.garg@linaro.org>
Message-ID: <ZNEDIlst3OVZF7P2@FVFF77S0Q05N.cambridge.arm.com>
References: <20230601213440.2488667-1-dianders@chromium.org>
 <CAD=FV=V2fFqwg3f3KS29+AkggHFDbyYvfAb12DrDn_PF8+bJjA@mail.gmail.com>
 <ZNDKVP2m-iiZCz3v@FVFF77S0Q05N.cambridge.arm.com>
 <CAFA6WYMD4TRR5psUyhu2jhZ2XBMUfav3D7_eH1HE8VJfXc7Fuw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFA6WYMD4TRR5psUyhu2jhZ2XBMUfav3D7_eH1HE8VJfXc7Fuw@mail.gmail.com>
X-Spam-Score: -2.3 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Aug 07, 2023 at 06:16:24PM +0530, Sumit Garg wrote:
 > On Mon, 7 Aug 2023 at 16:11, Mark Rutland <mark.rutland@arm.com> wrote:
 > > On Mon, Jul 24, 2023 at 08:55:44AM -0700, Doug Anderson wrote: [...] 
 Content analysis details:   (-2.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [217.140.110.172 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1qT1Sj-00GAVn-QZ
Subject: Re: [Kgdb-bugreport] [PATCH v9 0/7] arm64: Add debug IPI for
 backtraces / kgdb; try to use NMI for it
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
Cc: Lecopzer Chen <lecopzer.chen@mediatek.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>, linux-kernel@vger.kernel.org,
 Will Deacon <will@kernel.org>, Ingo Molnar <mingo@kernel.org>,
 Daniel Thompson <daniel.thompson@linaro.org>, Marc Zyngier <maz@kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Ard Biesheuvel <ardb@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 kgdb-bugreport@lists.sourceforge.net, Masayoshi Mizuma <msys.mizuma@gmail.com>,
 Wei Li <liwei391@huawei.com>, Frederic Weisbecker <frederic@kernel.org>,
 Valentin Schneider <vschneid@redhat.com>, Stephen Boyd <swboyd@chromium.org>,
 Ben Dooks <ben-linux@fluff.org>, Thomas Gleixner <tglx@linutronix.de>,
 Josh Poimboeuf <jpoimboe@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Andrey Konovalov <andreyknvl@gmail.com>, ito-yuichi@fujitsu.com,
 linux-perf-users@vger.kernel.org, "Gautham R. Shenoy" <gautham.shenoy@amd.com>,
 Jason Wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

T24gTW9uLCBBdWcgMDcsIDIwMjMgYXQgMDY6MTY6MjRQTSArMDUzMCwgU3VtaXQgR2FyZyB3cm90
ZToKPiBPbiBNb24sIDcgQXVnIDIwMjMgYXQgMTY6MTEsIE1hcmsgUnV0bGFuZCA8bWFyay5ydXRs
YW5kQGFybS5jb20+IHdyb3RlOgo+ID4gT24gTW9uLCBKdWwgMjQsIDIwMjMgYXQgMDg6NTU6NDRB
TSAtMDcwMCwgRG91ZyBBbmRlcnNvbiB3cm90ZToKPiA+ID4gT24gVGh1LCBKdW4gMSwgMjAyMyBh
dCAyOjM34oCvUE0gRG91Z2xhcyBBbmRlcnNvbiA8ZGlhbmRlcnNAY2hyb21pdW0ub3JnPiB3cm90
ZToKPiA+IEknZCBhbHNvIHN0cm9uZ2x5IHByZWZlciBpZiB3ZQo+ID4gY291bGQgaGF2ZSBzZXBh
cmF0ZSBJUElfQ1BVX0JBQ0tUUkFDRSBhbmQgSVBJX0NQVV9LR0RCIElQSXMsCj4gCj4gV2l0aCBj
dXJyZW50IGxvZ2ljIG9mIHNpbmdsZSBkZWJ1ZyBJUEksIGl0IGlzIG5vdCByZXF1aXJlZCBmb3Ig
YSB1c2VyCj4gdG8gZW5hYmxlIEtHREIgaW4gb3JkZXIgdG8gdXNlIHRoYXQgSVBJIGZvciBiYWNr
dHJhY2UuIFRoZSBvcmlnaW5hbAo+IG1vdGl2YXRpb24gZm9yIHRoaXMgbG9naWMgd2FzIHRoYXQg
dGhlIElQSXMgYXJlIGEgc2NhcmNlIHJlc291cmNlIG9uCj4gYXJtNjQgYXMgcGVyIGNvbW1lbnRz
IGZyb20gTWFyYy4gU28gSSBhbSBmaW5lIGVpdGhlciB3YXkgdG8ga2VlcCB0aGVtCj4gc2VwYXJh
dGUgb3IgdW5pZmllZC4KPiAKPiA+IGFuZCBJIHRoaW5rIHdlIGNhbgo+ID4gZG8gdGhhdCBlaXRo
ZXIgYnkgdW5pZnlpbmcgSVBJX0NQVV9TVE9QICYmIElQSV9DUFVfQ1JBU0hfU1RPUCBvciBieSBy
ZWNsYWltaW5nCj4gPiBJUElfV0FLRVVQIGJ5IHJldXNpbmcgYSBkaWZmZXJlbnQgSVBJIGZvciB0
aGUgcGFya2luZyBwcm90b2NvbCAoZS5nLgo+ID4gSVBJX1JFU0NIRURVTEUpLgo+IAo+IFRoYXQg
c291bmRzIGxpa2UgYSBnb29kIGNsZWFudXAuCgpJIHRvb2sgYSBxdWljayBzdGFiIGF0IHJlbW92
aW5nIElQSV9XQUtFVVAsIGFuZCBpdCBzZWVtcyBzaW1wbGUgZW5vdWdoOyBwYXRjaApiZWxvdy4K
Ck1hcmsuCgotLS0tPDgtLS0tCkZyb20gMjY3NDAxODI0NTc2YzFkZDNiYjZkMzgwMTQyYzkyZjcx
MDA5OGI2NyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKRnJvbTogTWFyayBSdXRsYW5kIDxtYXJr
LnJ1dGxhbmRAYXJtLmNvbT4KRGF0ZTogTW9uLCA3IEF1ZyAyMDIzIDE1OjA1OjQ3ICswMTAwClN1
YmplY3Q6IFtQQVRDSF0gYXJtNjQ6IHNtcDogUmVtb3ZlIGRlZGljYXRlZCB3YWtldXAgSVBJCgpU
byBlbmFibGUgTk1JIGJhY2t0cmFjZSBhbmQgS0dEQidzIE5NSSBjcHUgcm91bmR1cCwgd2UgbmVl
ZCB0byBmcmVlIHVwCmF0IGxlYXN0IG9uZSBkZWRpY2F0ZWQgSVBJLgoKT24gYXJtNjQgdGhlIElQ
SV9XQUtFVVAgSVBJIGlzIG9ubHkgdXNlZCBmb3IgdGhlIEFDUEkgcGFya2luZyBwcm90b2NvbCwK
d2hpY2ggaXRzZWxmIGlzIG9ubHkgdXNlZCBvbiBzb21lIHZlcnkgZWFybHkgQVJNdjggc3lzdGVt
cyB3aGljaApjb3VsZG4ndCBpbXBsZW1lbnQgUFNDSS4KClJlbW92ZSB0aGUgSVBJX1dBS0VVUCBJ
UEksIGFuZCByZWx5IG9uIHRoZSBJUElfUkVTQ0hFRFVMRSBJUEkgdG8gd2FrZQpDUFVzIGZyb20g
dGhlIHBhcmtlZCBzdGF0ZS4gVGhpcyB3aWxsIGNhdXNlIGEgdGlueSBhbW9udXQgb2YgcmVkdW5k
YW50CndvcmsgdG8gY2hlY2sgdGhlIHRocmVhZCBmbGFncywgYnV0IHRoaXMgaXMgbWluaXNjdWxl
IGluIHJlbGF0aW9uIHRvIHRoZQpjb3N0IG9mIHRha2luZyBhbmQgaGFuZGxpbmcgdGhlIElQSSBp
biB0aGUgZmlyc3QgcGxhY2UuIFdlIGNhbiBzYWZlbHkKaGFuZGxlIHJlZHVuZGFudCBJUElfUkVT
Q0hFRFVMRSBJUElzLCBzbyB0aGVyZSBzaG91bGQgYmUgbm8gZnVuY3Rpb25hbAppbXBhY3QgYXMg
YSByZXN1bHQgb2YgdGhpcyBjaGFuZ2UuCgpTaWduZWQtb2ZmLWJ5OiBNYXJrIFJ1dGxhbmQgPG1h
cmsucnV0bGFuZEBhcm0uY29tPgpDYzogQ2F0YWxpbiBNYXJpbmFzIDxjYXRhbGluLm1hcmluYXNA
YXJtLmNvbT4KQ2M6IERvdWdsYXMgQW5kZXJzb24gPGRpYW5kZXJzQGNocm9taXVtLm9yZz4KQ2M6
IE1hcmMgWnluZ2llciA8bWF6QGtlcm5lbC5vcmc+CkNjOiBTdW1pdCBHYXJnIDxzdW1pdC5nYXJn
QGxpbmFyby5vcmc+CkNjOiBXaWxsIERlYWNvbiA8d2lsbEBrZXJuZWwub3JnPgotLS0KIGFyY2gv
YXJtNjQvaW5jbHVkZS9hc20vc21wLmggICAgICAgICAgICAgIHwgIDQgKystLQogYXJjaC9hcm02
NC9rZXJuZWwvYWNwaV9wYXJraW5nX3Byb3RvY29sLmMgfCAgMiArLQogYXJjaC9hcm02NC9rZXJu
ZWwvc21wLmMgICAgICAgICAgICAgICAgICAgfCAyOCArKysrKysrKystLS0tLS0tLS0tLS0tLQog
MyBmaWxlcyBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspLCAyMCBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9hcmNoL2FybTY0L2luY2x1ZGUvYXNtL3NtcC5oIGIvYXJjaC9hcm02NC9pbmNsdWRl
L2FzbS9zbXAuaAppbmRleCA5YjMxZTZkMGRhMTc0Li43OThmZDc2YTg4M2EwIDEwMDY0NAotLS0g
YS9hcmNoL2FybTY0L2luY2x1ZGUvYXNtL3NtcC5oCisrKyBiL2FyY2gvYXJtNjQvaW5jbHVkZS9h
c20vc21wLmgKQEAgLTg5LDkgKzg5LDkgQEAgZXh0ZXJuIHZvaWQgYXJjaF9zZW5kX2NhbGxfZnVu
Y3Rpb25fc2luZ2xlX2lwaShpbnQgY3B1KTsKIGV4dGVybiB2b2lkIGFyY2hfc2VuZF9jYWxsX2Z1
bmN0aW9uX2lwaV9tYXNrKGNvbnN0IHN0cnVjdCBjcHVtYXNrICptYXNrKTsKIAogI2lmZGVmIENP
TkZJR19BUk02NF9BQ1BJX1BBUktJTkdfUFJPVE9DT0wKLWV4dGVybiB2b2lkIGFyY2hfc2VuZF93
YWtldXBfaXBpX21hc2soY29uc3Qgc3RydWN0IGNwdW1hc2sgKm1hc2spOworZXh0ZXJuIHZvaWQg
YXJjaF9zZW5kX3dha2V1cF9pcGkoaW50IGNwdSk7CiAjZWxzZQotc3RhdGljIGlubGluZSB2b2lk
IGFyY2hfc2VuZF93YWtldXBfaXBpX21hc2soY29uc3Qgc3RydWN0IGNwdW1hc2sgKm1hc2spCitz
dGF0aWMgaW5saW5lIHZvaWQgYXJjaF9zZW5kX3dha2V1cF9pcGkoaW50IGNwdSkKIHsKIAlCVUlM
RF9CVUcoKTsKIH0KZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQva2VybmVsL2FjcGlfcGFya2luZ19w
cm90b2NvbC5jIGIvYXJjaC9hcm02NC9rZXJuZWwvYWNwaV9wYXJraW5nX3Byb3RvY29sLmMKaW5k
ZXggYjE5OTBlMzhhZWQwYS4uZTFiZTI5ZTYwOGI3MSAxMDA2NDQKLS0tIGEvYXJjaC9hcm02NC9r
ZXJuZWwvYWNwaV9wYXJraW5nX3Byb3RvY29sLmMKKysrIGIvYXJjaC9hcm02NC9rZXJuZWwvYWNw
aV9wYXJraW5nX3Byb3RvY29sLmMKQEAgLTEwMyw3ICsxMDMsNyBAQCBzdGF0aWMgaW50IGFjcGlf
cGFya2luZ19wcm90b2NvbF9jcHVfYm9vdCh1bnNpZ25lZCBpbnQgY3B1KQogCQkgICAgICAgJm1h
aWxib3gtPmVudHJ5X3BvaW50KTsKIAl3cml0ZWxfcmVsYXhlZChjcHVfZW50cnktPmdpY19jcHVf
aWQsICZtYWlsYm94LT5jcHVfaWQpOwogCi0JYXJjaF9zZW5kX3dha2V1cF9pcGlfbWFzayhjcHVt
YXNrX29mKGNwdSkpOworCWFyY2hfc2VuZF93YWtldXBfaXBpKGNwdSk7CiAKIAlyZXR1cm4gMDsK
IH0KZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQva2VybmVsL3NtcC5jIGIvYXJjaC9hcm02NC9rZXJu
ZWwvc21wLmMKaW5kZXggZWRkNjM4OTRkNjFlOC4uYmUwMGM4YzVjMTcxMSAxMDA2NDQKLS0tIGEv
YXJjaC9hcm02NC9rZXJuZWwvc21wLmMKKysrIGIvYXJjaC9hcm02NC9rZXJuZWwvc21wLmMKQEAg
LTcyLDcgKzcyLDYgQEAgZW51bSBpcGlfbXNnX3R5cGUgewogCUlQSV9DUFVfQ1JBU0hfU1RPUCwK
IAlJUElfVElNRVIsCiAJSVBJX0lSUV9XT1JLLAotCUlQSV9XQUtFVVAsCiAJTlJfSVBJCiB9Owog
CkBAIC03NjQsNyArNzYzLDYgQEAgc3RhdGljIGNvbnN0IGNoYXIgKmlwaV90eXBlc1tOUl9JUEld
IF9fdHJhY2Vwb2ludF9zdHJpbmcgPSB7CiAJW0lQSV9DUFVfQ1JBU0hfU1RPUF0JPSAiQ1BVIHN0
b3AgKGZvciBjcmFzaCBkdW1wKSBpbnRlcnJ1cHRzIiwKIAlbSVBJX1RJTUVSXQkJPSAiVGltZXIg
YnJvYWRjYXN0IGludGVycnVwdHMiLAogCVtJUElfSVJRX1dPUktdCQk9ICJJUlEgd29yayBpbnRl
cnJ1cHRzIiwKLQlbSVBJX1dBS0VVUF0JCT0gIkNQVSB3YWtlLXVwIGludGVycnVwdHMiLAogfTsK
IAogc3RhdGljIHZvaWQgc21wX2Nyb3NzX2NhbGwoY29uc3Qgc3RydWN0IGNwdW1hc2sgKnRhcmdl
dCwgdW5zaWduZWQgaW50IGlwaW5yKTsKQEAgLTc5NywxMyArNzk1LDYgQEAgdm9pZCBhcmNoX3Nl
bmRfY2FsbF9mdW5jdGlvbl9zaW5nbGVfaXBpKGludCBjcHUpCiAJc21wX2Nyb3NzX2NhbGwoY3B1
bWFza19vZihjcHUpLCBJUElfQ0FMTF9GVU5DKTsKIH0KIAotI2lmZGVmIENPTkZJR19BUk02NF9B
Q1BJX1BBUktJTkdfUFJPVE9DT0wKLXZvaWQgYXJjaF9zZW5kX3dha2V1cF9pcGlfbWFzayhjb25z
dCBzdHJ1Y3QgY3B1bWFzayAqbWFzaykKLXsKLQlzbXBfY3Jvc3NfY2FsbChtYXNrLCBJUElfV0FL
RVVQKTsKLX0KLSNlbmRpZgotCiAjaWZkZWYgQ09ORklHX0lSUV9XT1JLCiB2b2lkIGFyY2hfaXJx
X3dvcmtfcmFpc2Uodm9pZCkKIHsKQEAgLTg5NywxNCArODg4LDYgQEAgc3RhdGljIHZvaWQgZG9f
aGFuZGxlX0lQSShpbnQgaXBpbnIpCiAJCWJyZWFrOwogI2VuZGlmCiAKLSNpZmRlZiBDT05GSUdf
QVJNNjRfQUNQSV9QQVJLSU5HX1BST1RPQ09MCi0JY2FzZSBJUElfV0FLRVVQOgotCQlXQVJOX09O
Q0UoIWFjcGlfcGFya2luZ19wcm90b2NvbF92YWxpZChjcHUpLAotCQkJICAiQ1BVJXU6IFdha2Ut
dXAgSVBJIG91dHNpZGUgdGhlIEFDUEkgcGFya2luZyBwcm90b2NvbFxuIiwKLQkJCSAgY3B1KTsK
LQkJYnJlYWs7Ci0jZW5kaWYKLQogCWRlZmF1bHQ6CiAJCXByX2NyaXQoIkNQVSV1OiBVbmtub3du
IElQSSBtZXNzYWdlIDB4JXhcbiIsIGNwdSwgaXBpbnIpOwogCQlicmVhazsKQEAgLTk3OSw2ICs5
NjIsMTcgQEAgdm9pZCBhcmNoX3NtcF9zZW5kX3Jlc2NoZWR1bGUoaW50IGNwdSkKIAlzbXBfY3Jv
c3NfY2FsbChjcHVtYXNrX29mKGNwdSksIElQSV9SRVNDSEVEVUxFKTsKIH0KIAorI2lmZGVmIENP
TkZJR19BUk02NF9BQ1BJX1BBUktJTkdfUFJPVE9DT0wKK3ZvaWQgYXJjaF9zZW5kX3dha2V1cF9p
cGkoaW50IGNwdSkKK3sKKwkvKgorCSAqIFdlIHVzZSBhIHNjaGVkdWxlciBJUEkgdG8gd2FrZSB0
aGUgQ1BVIGFzIHRoaXMgYXZvaWRzIHRoZSBuZWVkIGZvciBhCisJICogZGVkaWNhdGVkIElQSSBh
bmQgd2UgY2FuIHNhZmVseSBoYW5kbGUgc3B1cmlvdXMgc2NoZWR1bGVyIElQSXMuCisJICovCisJ
YXJjaF9zbXBfc2VuZF9yZXNjaGVkdWxlKGNwdSk7Cit9CisjZW5kaWYKKwogI2lmZGVmIENPTkZJ
R19HRU5FUklDX0NMT0NLRVZFTlRTX0JST0FEQ0FTVAogdm9pZCB0aWNrX2Jyb2FkY2FzdChjb25z
dCBzdHJ1Y3QgY3B1bWFzayAqbWFzaykKIHsKLS0gCjIuMzAuMgoKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpLZ2RiLWJ1Z3JlcG9ydCBtYWlsaW5nIGxp
c3QKS2dkYi1idWdyZXBvcnRAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291
cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2tnZGItYnVncmVwb3J0Cg==
