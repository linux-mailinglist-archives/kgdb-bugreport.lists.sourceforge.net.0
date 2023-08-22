Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E860783A0D
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 22 Aug 2023 08:36:02 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1qYKzh-0001kn-Ai
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 22 Aug 2023 06:36:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <mark.rutland@arm.com>) id 1qYKzf-0001kX-9W
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 22 Aug 2023 06:35:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wIRGQJJPQD94yHQIIkybOO9fCAfVP3kmMpyCvQRs9hM=; b=cYy3bN2caZAqQneMTjXoq8f6Yp
 otDpNv/CTppxYGLjVyMeU/8hqO60AB6qsCxZvVtH5Q/pV58cMbqlvrNG0WeMrOY4zd2JRa8E8vLGv
 fj6wprUMuXwmFa1lOuLmv+W5Y7Q+/6Sbo+wYudawCnDiGp3VnD6Oipk2nIzfExdDHcA8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wIRGQJJPQD94yHQIIkybOO9fCAfVP3kmMpyCvQRs9hM=; b=i+oj8Vc9pQqFxrO8SfceJol4Su
 Sj/jL5GeEzieTDGJOpFi1Stf61UVn8YlOdRsZaFeCY0Brx5iJUmWT1qMliSi//fnqXU69ZSIjJda6
 wWFVbUWDKSLf71zOUw43IoxfL64KS8twgJ3+5pRhW4Xi2LKWrqdCuHI4lG3JDGjZjd7I=;
Received: from foss.arm.com ([217.140.110.172])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtp (Exim 4.95)
 id 1qYKzc-00C4UK-L3 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 22 Aug 2023 06:35:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EE0F12F4;
 Mon, 21 Aug 2023 23:36:31 -0700 (PDT)
Received: from FVFF77S0Q05N (unknown [10.57.3.221])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5A2D23F740;
 Mon, 21 Aug 2023 23:35:48 -0700 (PDT)
Date: Tue, 22 Aug 2023 07:35:41 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Doug Anderson <dianders@chromium.org>
Message-ID: <ZORXPXbi3f8tUY-N@FVFF77S0Q05N>
References: <20230601213440.2488667-1-dianders@chromium.org>
 <20230601143109.v9.5.I65981105e1f62550b0316625dd1e599deaf9e1aa@changeid>
 <ZNDGMJW01avOMShn@FVFF77S0Q05N.cambridge.arm.com>
 <CAD=FV=Wz4Y836__Fo=Va8ek9BLEoTTbYx_zycBuVony37eOGVg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAD=FV=Wz4Y836__Fo=Va8ek9BLEoTTbYx_zycBuVony37eOGVg@mail.gmail.com>
X-Spam-Score: -2.3 (--)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Mon, Aug 21, 2023 at 05:06:50PM -0700, Doug Anderson wrote:
    > On Mon, Aug 7, 2023 at 3:23 AM Mark Rutland <mark.rutland@arm.com> wrote:
    > > On Thu, Jun 01, 2023 at 02:31:49PM -0700, Douglas Ander [...] 
 
 Content analysis details:   (-2.3 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
                             medium trust
                             [217.140.110.172 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1qYKzc-00C4UK-L3
Subject: Re: [Kgdb-bugreport] [PATCH v9 5/7] arm64: ipi_debug: Add support
 for backtrace using the debug IPI
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
 Catalin Marinas <catalin.marinas@arm.com>, ito-yuichi@fujitsu.com,
 linux-kernel@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
 linux-perf-users@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
 Marc Zyngier <maz@kernel.org>, kgdb-bugreport@lists.sourceforge.net,
 Thomas Gleixner <tglx@linutronix.de>, Masayoshi Mizuma <msys.mizuma@gmail.com>,
 Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

T24gTW9uLCBBdWcgMjEsIDIwMjMgYXQgMDU6MDY6NTBQTSAtMDcwMCwgRG91ZyBBbmRlcnNvbiB3
cm90ZToKPiBPbiBNb24sIEF1ZyA3LCAyMDIzIGF0IDM6MjPigK9BTSBNYXJrIFJ1dGxhbmQgPG1h
cmsucnV0bGFuZEBhcm0uY29tPiB3cm90ZToKPiA+IE9uIFRodSwgSnVuIDAxLCAyMDIzIGF0IDAy
OjMxOjQ5UE0gLTA3MDAsIERvdWdsYXMgQW5kZXJzb24gd3JvdGU6Cj4gPiA+IEZyb206IFN1bWl0
IEdhcmcgPHN1bWl0LmdhcmdAbGluYXJvLm9yZz4KCj4gPiA+ICBzdGF0aWMgaXJxcmV0dXJuX3Qg
aXBpX2RlYnVnX2hhbmRsZXIoaW50IGlycSwgdm9pZCAqZGF0YSkKPiA+ID4gIHsKPiA+ID4gLSAg
ICAgLyogbm9wLCBOTUkgaGFuZGxlcnMgZm9yIHNwZWNpYWwgZmVhdHVyZXMgY2FuIGJlIGFkZGVk
IGhlcmUuICovCj4gPiA+ICsgICAgIGlycXJldHVybl90IHJldCA9IElSUV9OT05FOwo+ID4gPiAr
Cj4gPiA+ICsgICAgIC8qCj4gPiA+ICsgICAgICAqIE5PVEU6IEp1c3QgbGlrZSBpbiBhcmNoX3Ry
aWdnZXJfY3B1bWFza19iYWNrdHJhY2UoKSwgd2UncmUgY2FsbGluZwo+ID4gPiArICAgICAgKiBh
IGZ1bmN0aW9uIHdpdGggIm5taV8iIGluIHRoZSBuYW1lIGJ1dCBpdCB3b3JrcyBmaW5lIGV2ZW4g
aWYgd2UKPiA+ID4gKyAgICAgICogYXJlIHVzaW5nIGEgcmVndWxhb3IgSVBJLgo+ID4gPiArICAg
ICAgKi8KPiA+ID4gKyAgICAgaWYgKG5taV9jcHVfYmFja3RyYWNlKGdldF9pcnFfcmVncygpKSkK
PiA+ID4gKyAgICAgICAgICAgICByZXQgPSBJUlFfSEFORExFRDsKPiA+ID4KPiA+Cj4gPiBEb2Vz
IHRoaXMgbmVlZCB0aGUgcHJpbnRrX2RlZmVycmVkX3tlbnRlcixleGl0fSgpIHRoYXQgMzItYml0
IGFybSBoYXM/Cj4gCj4gSSBkb24ndCBfdGhpbmtfIHNvLCBidXQgSSBhbHNvIGRvbid0IF90aGlu
a18gaXQncyBuZWVkZWQgZm9yIGFybTMyLgo+IDstKSBMZXQgbWUgZXhwbGFpbiBteSBsb2dpYyBh
bmQgeW91IGNhbiB0ZWxsIG1lIGlmIGl0IHNvdW5kcyByaWdodCB0bwo+IHlvdS4KPiAKPiBJZiB3
ZSdyZSBkb2luZyB0aGUgYmFja3RyYWNlIGluIHBzZXVkby1OTUkgY29udGV4dCB0aGVuIHdlIGRl
ZmluaXRlbHkKPiBkb24ndCBuZWVkIGl0LiBTcGVjaWZpY2FsbHksIHRoZSBwcmludGtfZGVmZXJy
ZWRfe2VudGVyLGV4aXR9KCkganVzdAo+IG1hbmFnZXMgdGhlIHBlci1jcHUgInByaW50a19jb250
ZXh0IiB2YWx1ZS4gVGhhdCB2YWx1ZSBkb2Vzbid0IG1hdHRlcgo+IGlmICJpbl9ubWkoKSIgcmV0
dXJucyB0cnVlLgo+IAo+IElmIHdlJ3JlIF9ub3RfIGRvaW5nIHRoZSBiYWNrdHJhY2UgaW4gcHNl
dWRvLU5NSSBjb250ZXh0IHRoZW4gSSB0aGluawo+IHdlIGFsc28gZG9uJ3QgbmVlZCBpdC4gQWZ0
ZXIgYWxsLCBpZiB3ZSdyZSBub3QgaW4gcHNldWRvLU5NSSBjb250ZXh0Cj4gdGhlbiBpdCdzIHBl
cmZlY3RseSBmaW5lIHRvIHByaW50LCByaWdodD8KPiAKPiBXaGlsZSBpdCdzIGhhcmQgdG8ga25v
dyAxMDAlIGZvciBzdXJlLCBteSBiZXN0IGd1ZXNzIGlzIHRoYXQgaW4gYXJtCj4gdGhpcyBtaWdo
dCBoYXZlIGhlbHBlZCBwcmV2ZW50IHN0YWNrIHRyYWNlcyBmcm9tIGdldHRpbmcgaW50ZXJzcGVy
c2VkCj4gYW1vbmcgb25lIGFub3RoZXIuIEkgZ3Vlc3MgdGhpcyBpcyBubyBsb25nZXIgbmVlZGVk
IGFzIG9mIGNvbW1pdAo+IDU1ZDZhZjFkNjY4OCAoImxpYi9ubWlfYmFja3RyYWNlOiBleHBsaWNp
dGx5IHNlcmlhbGl6ZSBiYW5uZXIgYW5kCj4gcmVncyIpPyBJbiBhbnkgY2FzZSwgd2hlbiBJIHRl
c3RlZCB0aGlzIGVhcmxpZXIgdGhpbmdzIHNlZW1lZCB0bwo+IHByaW50b3V0IGZpbmUgd2l0aG91
dCBpdC4uLgoKVGhhbmtzIGZvciB0aGF0IGV4cGxhbmF0aW9uOyB0aGF0IG1ha2VzIHNlbnNlIHRv
IG1lISBMb29raW5nIGFyb3VuZCBhIGJpdCBJIHNlZQp0aGF0IHg4NiBkb2Vzbid0IGJvdGhlciBl
aXRoZXIuCgo+IFRoYXQgYmVpbmcgc2FpZCwgaXQgd291bGRuJ3QgaHVydCB0byBpbmNsdWRlIGl0
IGhlcmUgYW5kIEknbGwgZG8gaXQgaWYgeW91Cj4gd2FudC4KCk5vIG5lZWQgLS0gSSdtIGhhcHB5
IHdpdGhvdXQgaXQuCgpUaGFua3MsCk1hcmsuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KS2dkYi1idWdyZXBvcnQgbWFpbGluZyBsaXN0CktnZGItYnVn
cmVwb3J0QGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5l
dC9saXN0cy9saXN0aW5mby9rZ2RiLWJ1Z3JlcG9ydAo=
