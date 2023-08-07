Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EB46277253E
	for <lists+kgdb-bugreport@lfdr.de>; Mon,  7 Aug 2023 15:16:11 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1qT05j-0006v2-8b
	for lists+kgdb-bugreport@lfdr.de;
	Mon, 07 Aug 2023 13:16:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <sumit.garg@linaro.org>) id 1qT05h-0006uv-VN
 for kgdb-bugreport@lists.sourceforge.net;
 Mon, 07 Aug 2023 13:16:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9t5nBRjNzdkdc9QzeOluuR4xKMtvtID49kCNpeDzH2Y=; b=L0nW3M+ERZ5olmAzyaPtP0N+i9
 I7up1Jy3/NO/fvo8I/u7xNCt4Fzs+EIXtsN9CeU2Vzie+elIyGzybS62SqmVEZ/MxcQuXuYEY39Zr
 mZl/ijmP4TbWPtAA3GS/9P83yqzkiznyRoyElhIPp7r2OtRERVE7dPIdVsxDTblIr2TA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9t5nBRjNzdkdc9QzeOluuR4xKMtvtID49kCNpeDzH2Y=; b=Vf3GmxuZwJ51nbj27IseBj6nea
 GDUjQS+CNfUD/bnph/hyYFoRf5UciXRp5zO5pz6B+jc23v+PmHLDOhQlvbdFiSwA5x/d2KPFl1n2l
 Od/p4n1punb/btp2Irpf+ziIxGf/X3n72wp+UqdofS8MHFgy07ABX/+s9ItCkpF8BGXU=;
Received: from mail-yw1-f177.google.com ([209.85.128.177])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qT05c-00G1ee-2P for kgdb-bugreport@lists.sourceforge.net;
 Mon, 07 Aug 2023 13:16:08 +0000
Received: by mail-yw1-f177.google.com with SMTP id
 00721157ae682-58451ecf223so48796897b3.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 07 Aug 2023 06:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691414158; x=1692018958;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9t5nBRjNzdkdc9QzeOluuR4xKMtvtID49kCNpeDzH2Y=;
 b=HS7TTt5eBMd0UDsPUK6e1DI9iZJvELbmd2P5uZPpeK4fSw+oP4iQbu2kNmT/NX1j0l
 dBnTR4REjX9wAmiA0NWxxh8ZjtKXI0yZzVgrbjWSyiyoPRRsdRM1sgepnnUkjacjjgJP
 HC/ELfMDX74X5euaZe2HduVZzsfkJxFhnIpF8fTo94S81mylzQ/obp9QpN8LbMu30NCN
 4uh2e5eD0n1PwsZQMp0k52r5YKFuCQMTgei/f+GHNNPRD6AM1oSdNYNd9+uFxlD9xonn
 XaQzg0H89+PPiMXmxeynH0v4RBx7DmIO0QznyGq7vRmESAYnGiL3falYN4VJDb1Dsdex
 Bt2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691414158; x=1692018958;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9t5nBRjNzdkdc9QzeOluuR4xKMtvtID49kCNpeDzH2Y=;
 b=jbfEZ/cQ/GUaUIFp9iqxuKg0lck+ZoFq8/57lcSOhKAimYAoo3tDsqshz4VUMaN9jL
 o/gk9qHptjP8lgxAB9b9QVJ7OW2812+TPVUS6lSg0FFxlAuqlFSehd+nbl+Es9JYMx4m
 bcCjPBakchRmcomd73bDHTJgUMh0cLU37fbFezRnzDUid9wcRxqOeEQ4kZFRei+tAzKy
 d4CFOhPIHSH9jRLuO7ZoduyLZMb+8gbiHyvKd4XvtS951QfIVVi/PLbuiD7bEBKeA920
 QNMN3LFRg6xDvxtpMzf7hUf9aF+X5u6ANqd/OB/OTouuBAeKZ3Ih02+l27mvU6ufii/T
 NJ9Q==
X-Gm-Message-State: AOJu0YxnZJnCdhjjGyOv3UQ5b3nEGVhWulmcp/5qrxxutx8z5jYaY87E
 0eE+B3/boBB7W86a7TDw0Y/CLmFf0PAflSD8w/CYZu0ZGIX52sJ8HaE=
X-Google-Smtp-Source: AGHT+IG2sQb4KYXITpRPT/2oajN8A3GYoBsP/KAHU7XnME8OTvWW3UQnsC7Bentk96hJ/VHFSMldrPbP1fvvCyVgaIE=
X-Received: by 2002:a67:f912:0:b0:446:da54:19b3 with SMTP id
 t18-20020a67f912000000b00446da5419b3mr4527404vsq.23.1691412395913; Mon, 07
 Aug 2023 05:46:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230601213440.2488667-1-dianders@chromium.org>
 <CAD=FV=V2fFqwg3f3KS29+AkggHFDbyYvfAb12DrDn_PF8+bJjA@mail.gmail.com>
 <ZNDKVP2m-iiZCz3v@FVFF77S0Q05N.cambridge.arm.com>
In-Reply-To: <ZNDKVP2m-iiZCz3v@FVFF77S0Q05N.cambridge.arm.com>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Mon, 7 Aug 2023 18:16:24 +0530
Message-ID: <CAFA6WYMD4TRR5psUyhu2jhZ2XBMUfav3D7_eH1HE8VJfXc7Fuw@mail.gmail.com>
To: Mark Rutland <mark.rutland@arm.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, 7 Aug 2023 at 16:11,
 Mark Rutland <mark.rutland@arm.com>
 wrote: > > Hi Doug, > > Apologies for the delay. > > On Mon, Jul 24, 2023
 at 08:55:44AM -0700, Doug Anderson wrote: > > On Thu, Jun 1, [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.128.177 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.177 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1qT05c-00G1ee-2P
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

T24gTW9uLCA3IEF1ZyAyMDIzIGF0IDE2OjExLCBNYXJrIFJ1dGxhbmQgPG1hcmsucnV0bGFuZEBh
cm0uY29tPiB3cm90ZToKPgo+IEhpIERvdWcsCj4KPiBBcG9sb2dpZXMgZm9yIHRoZSBkZWxheS4K
Pgo+IE9uIE1vbiwgSnVsIDI0LCAyMDIzIGF0IDA4OjU1OjQ0QU0gLTA3MDAsIERvdWcgQW5kZXJz
b24gd3JvdGU6Cj4gPiBPbiBUaHUsIEp1biAxLCAyMDIzIGF0IDI6MzfigK9QTSBEb3VnbGFzIEFu
ZGVyc29uIDxkaWFuZGVyc0BjaHJvbWl1bS5vcmc+IHdyb3RlOgo+ID4gSSdtIGxvb2tpbmcgZm9y
IHNvbWUgaWRlYXMgb24gd2hhdCB0byBkbyB0byBtb3ZlIHRoaXMgcGF0Y2ggc2VyaWVzCj4gPiBm
b3J3YXJkLiBUaGFua3MgdG8gRGFuaWVsLCB0aGUga2dkYiBwYXRjaCBpcyBub3cgaW4gTGludXMn
cyB0cmVlIHdoaWNoCj4gPiBob3BlZnVsbHkgbWFrZXMgdGhpcyBzaW1wbGVyIHRvIGxhbmQuIEkg
Z3Vlc3MgdGhlcmUgaXMgc3RpbGwgdGhlCj4gPiBpcnFjaGlwIGRlcGVuZGVuY3kgdGhhdCB3aWxs
IG5lZWQgdG8gYmUgc29ydGVkIG91dCwgdGhvdWdoLi4uCj4gPgo+ID4gRXZlbiBpZiBmb2xrcyBh
cmVuJ3QgaW4gYWdyZWVtZW50IGFib3V0IHdoZXRoZXIgdGhpcyBpcyByZWFkeSB0byBiZQo+ID4g
ZW5hYmxlZCBpbiBwcm9kdWN0aW9uLCBJIGRvbid0IHRoaW5rIGFueXRoaW5nIGhlcmUgaXMgc3Vw
ZXIKPiA+IG9iamVjdGlvbmFibGUgb3IgY29udHJvdmVyc2lhbCwgaXMgaXQ/IENhbiB3ZSBsYW5k
IGl0PyBJZiB5b3UgZmVlbAo+ID4gbGlrZSBpdCBuZWVkcyBleHRyYSByZXZpZXcsIHdvdWxkIGl0
IGhlbHAgaWYgSSB0cmllZCB0byBkcnVtIHVwIHNvbWUKPiA+IGV4dHJhIHBlb3BsZSB0byBwcm92
aWRlIHJldmlldyBmZWVkYmFjaz8KPgo+IElnbm9yaW5nIHRoZSBzb3VuZG5lc3MgaXNzdWVzIEkg
bWVudGlvbmVkIGJlZm9yZSAod2hpY2ggSSdtIHNsb3dseSBjaGlwcGluZwo+IGF3YXkgYXQsIGFu
ZCB5b3UncmUgbGlrZWx5IGx1Y2t5IGVub3VnaCB0byBhdm9pZCBpbiBwcmFjdGljZSkuLi4KPgo+
IEhhdmluZyBsb29rZWQgb3ZlciB0aGUgc2VyaWVzLCBJIHRoaW5rIHRoZSBHSUN2MyBiaXQgaXNu
J3QgcXVpdGUgcmlnaHQsIGJ1dCBpcwo+IGVhc3kgZW5vdWdoIHRvIGZpeC4gSSd2ZSBjb21tZW50
ZWQgb24gdGhlIHBhdGNoIHdpdGggd2hhdCBJIHRoaW5rIHdlIHNob3VsZAo+IGhhdmUgdGhlcmUu
CgpUaGFua3MgZm9yIGNhdGNoaW5nIHRoaXMgYW5kIEkgYWdyZWUgd2l0aCB5b3VyIHByb3Bvc2Vk
IGZpeC4KCj4KPiBUaGUgb25seSBtYWpvciB0aGluZyBvdGhlcndpc2UgZnJvbSBteSBQb1YgaXMg
dGhlIHN0cnVjdHVyZSBvZiB0aGUgZGVidWcgSVBJCj4gZnJhbWV3b3JrLiBJJ20gbm90IGtlZW4g
b24gdGhhdCBiZWluZyBhIHNlcGFyYXRlIGJvZHkgb2YgY29kZSBhbmQgSSB0aGluayBpdAo+IHNo
b3VsZCBsaXZlIGluIHNtcC5jIGFsb25nIHdpdGggdGhlIG90aGVyIElQSXMuCgpUaGF0J3MgYSBm
YWlyIHBvaW50LgoKPiBJJ2QgYWxzbyBzdHJvbmdseSBwcmVmZXIgaWYgd2UKPiBjb3VsZCBoYXZl
IHNlcGFyYXRlIElQSV9DUFVfQkFDS1RSQUNFIGFuZCBJUElfQ1BVX0tHREIgSVBJcywKCldpdGgg
Y3VycmVudCBsb2dpYyBvZiBzaW5nbGUgZGVidWcgSVBJLCBpdCBpcyBub3QgcmVxdWlyZWQgZm9y
IGEgdXNlcgp0byBlbmFibGUgS0dEQiBpbiBvcmRlciB0byB1c2UgdGhhdCBJUEkgZm9yIGJhY2t0
cmFjZS4gVGhlIG9yaWdpbmFsCm1vdGl2YXRpb24gZm9yIHRoaXMgbG9naWMgd2FzIHRoYXQgdGhl
IElQSXMgYXJlIGEgc2NhcmNlIHJlc291cmNlIG9uCmFybTY0IGFzIHBlciBjb21tZW50cyBmcm9t
IE1hcmMuIFNvIEkgYW0gZmluZSBlaXRoZXIgd2F5IHRvIGtlZXAgdGhlbQpzZXBhcmF0ZSBvciB1
bmlmaWVkLgoKPiBhbmQgSSB0aGluayB3ZSBjYW4KPiBkbyB0aGF0IGVpdGhlciBieSB1bmlmeWlu
ZyBJUElfQ1BVX1NUT1AgJiYgSVBJX0NQVV9DUkFTSF9TVE9QIG9yIGJ5IHJlY2xhaW1pbmcKPiBJ
UElfV0FLRVVQIGJ5IHJldXNpbmcgYSBkaWZmZXJlbnQgSVBJIGZvciB0aGUgcGFya2luZyBwcm90
b2NvbCAoZS5nLgo+IElQSV9SRVNDSEVEVUxFKS4KClRoYXQgc291bmRzIGxpa2UgYSBnb29kIGNs
ZWFudXAuCgo+Cj4gSSB0aGluayBpdCdkIGJlIG5pY2UgaWYgdGhlIHNlcmllcyBjb3VsZCBlbmFi
bGUgTk1JcyBmb3IgYmFja3RyYWNlIGFuZCB0aGUKPiBDUFVfeyxDUkFTSF99U1RPUCBjYXNlcywg
d2l0aCBLR0RCIGJlaW5nIHRoZSBib251cyBhdG9wLiBUaGF0IHdheSBpdCdkIGJlCj4gY2xlYXJs
eSBiZW5lZmljaWFsIGZvciBhbnlvbmUgdHJ5aW5nIHRvIGRlYnVnIGxvY2t1cHMgZXZlbiBpZiB0
aGV5J3JlIG5vdCBhCj4gS0dEQiB1c2VyLgo+CgpJdCdzIGdvb2QgdG8gc2VlIG90aGVyIHVzZS1j
YXNlcyBvZiBJUElzIHR1cm5lZCBpbnRvIE5NSXMuCgotU3VtaXQKCj4gPiBBbHNvOiBpbiBjYXNl
IGl0J3MgaW50ZXJlc3RpbmcgdG8gYW55b25lLCBJJ3ZlIGJlZW4gZG9pbmcgYmVuY2htYXJrcwo+
ID4gb24gc2M3MTgwLXRyb2dkb3IgZGV2aWNlcyBpbiBwcmVwYXJhdGlvbiBmb3IgZW5hYmxpbmcg
dGhpcy4gT24gdGhhdAo+ID4gcGxhdGZvcm0sIEkgZGlkIG1hbmFnZSB0byBzZWUgYWJvdXQgNCUg
cmVkdWN0aW9uIGluIGEgc2V0IG9mIGhhY2tiZW5jaAo+ID4gbnVtYmVycyB3aGVuIGZ1bGx5IGVu
YWJsaW5nIHBzZXVkby1OTUkuIEhvd2V2ZXIsIHdoZW4gSSBpbnN0ZWFkIHJhbgo+ID4gU3BlZWRv
bWV0ZXIgMi4xIEkgc2F3IG5vIGRpZmZlcmVuY2UuIFNlZToKPiA+Cj4gPiBodHRwczovL2lzc3Vl
dHJhY2tlci5nb29nbGUuY29tL2lzc3Vlcy8xOTcwNjE5ODcKPgo+IFRoYW5rcyBmb3IgdGhlIHBv
aW50ZXIhCj4KPiBJIGtub3cgdGhhdCB0aGVyZSBhcmUgYSBjb3VwbGUgb2YgdGhpbmdzIHRoYXQg
d2UgY291bGQgZG8gdG8gc2xpZ2h0bHkgaW1wcm92ZQo+IGxvY2FsX2lycV8qKCkgd2hlbiB1c2lu
ZyBwTk1JcywgdGhvdWdoIEkgc3VzcGVjdCB0aGF0IHRoZSBidWxrIG9mIHRoZSBjb3N0Cj4gdGhl
cmUgd2lsbCBjb21lIGZyb20gdGhlIG5lY2Vzc2FyeSBzeW5jaHJvbml6YXRpb24uCj4KPiBUaGFu
a3MsCj4gTWFyay4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpLZ2RiLWJ1Z3JlcG9ydCBtYWlsaW5nIGxpc3QKS2dkYi1idWdyZXBvcnRAbGlzdHMuc291
cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZv
L2tnZGItYnVncmVwb3J0Cg==
