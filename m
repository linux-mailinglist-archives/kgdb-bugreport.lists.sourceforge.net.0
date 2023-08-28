Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 750A478B48D
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 28 Aug 2023 17:35:53 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1qaeHP-0006qf-7h
	for lists+kgdb-bugreport@lfdr.de;
	Mon, 28 Aug 2023 15:35:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1qaeHO-0006qZ-9w
 for kgdb-bugreport@lists.sourceforge.net;
 Mon, 28 Aug 2023 15:35:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=J20soSuN4iUiNmxOSPdPjy08oKocmaSVaDQ2dqW28vI=; b=H2/VLVudofAOqsZB5hE0LAMecd
 VU/QwvlJvjKDdDlX08nb4naCMavsW+93/9FJcykQNrapN93Gp7GS4Ij0UkMhSpA0vHVFsMW7Ntq+E
 H8XPBE7qxQQWjY+PhazKyepr1ZUdsdKXQk78LoQJjeq3QaloDt4+7cITZYKhBm6FC0Io=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=J20soSuN4iUiNmxOSPdPjy08oKocmaSVaDQ2dqW28vI=; b=RaWyDfF6fZDg6rFSjZwPPmnJ6u
 ONRenka/R1GHrSXtEDiEUe1h9uWqTWbd9jMfP3ed2Mis/MPsAU2HzIVjPou9sZf6Yra3txjqkQsiF
 RvWZioalPjUX0j2wFba9jh+e6rJ8HObHXfHcY+1XnAiT2dF4dAQ2cOeC/JiADIIjR788=;
Received: from mail-ej1-f47.google.com ([209.85.218.47])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qaeHN-000t63-I8 for kgdb-bugreport@lists.sourceforge.net;
 Mon, 28 Aug 2023 15:35:51 +0000
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-99bcf2de59cso444379466b.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 28 Aug 2023 08:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1693236941; x=1693841741;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=J20soSuN4iUiNmxOSPdPjy08oKocmaSVaDQ2dqW28vI=;
 b=UJrY4OGBWFJE1SuNYXhydM4g6MnuROT2Nn9Ehvief3kfQCRKN81uwtWSLE2rDDvqi4
 W6iEErllaA8K6cT5zBi8JQkX6e1aKu4nlsXj4Tg8qdzBgT9yi3Ks72KyqXMhdvmM7B6W
 Kl9MLyu6BMHPcV0mMf03MCRFNx+kFrTk98biw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693236941; x=1693841741;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=J20soSuN4iUiNmxOSPdPjy08oKocmaSVaDQ2dqW28vI=;
 b=ESsRnKW6AE1VgA940EcrfXw/fjzwL+kw/wVd+obDnK3QKfWPrA5kvu/NkXf+wqeQKf
 UWs2XwVfu6aLN7W/NOhOhqNqMtzJDc5q+3pTZowDbJASAMLvjnKxsaMgqa2hYnEhT4My
 68Q/GHdnC86Ay359ajpzUmiz7RVXiVXD8chgKDkTLeLthxhrg8ZmQSn7VAeJu7i1v09z
 P+AhdX8GhQ5zAnarKdzW9/BM3HiNeVyrD0/xFWXydB1s3BOy5zvIqaXAG9wozakhmeZJ
 Rea5Ah9yfU2x5RYXduQpJ+1d3fwvqkC9VEvfspvbbWqy7uoGLsR6unFFtmGnB0KDd/Ii
 8C/g==
X-Gm-Message-State: AOJu0YxkE8v8n6mDKcU7ClJ4sbKsqXilD2Z0SPUzr90whNxxwS+tIERH
 4xuZxSum+YSdQaqb/qKFYqiYcmHqDD1vEKh9RW/tKQ==
X-Google-Smtp-Source: AGHT+IFP2JwI6aRZtUCGyHMammRV2iO9qL5wtbbRuLhfIySN2YMdU7bN1Tk7K2eagiKXIGGCWSTyJw==
X-Received: by 2002:a17:906:1baa:b0:994:522f:3f4a with SMTP id
 r10-20020a1709061baa00b00994522f3f4amr17495363ejg.29.1693236941212; 
 Mon, 28 Aug 2023 08:35:41 -0700 (PDT)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com.
 [209.85.128.50]) by smtp.gmail.com with ESMTPSA id
 d7-20020a1709064c4700b0099bd453357esm4740070ejw.41.2023.08.28.08.35.40
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Aug 2023 08:35:40 -0700 (PDT)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-4005f0a6c2bso116995e9.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 28 Aug 2023 08:35:40 -0700 (PDT)
X-Received: by 2002:a05:600c:1c23:b0:3f7:3e85:36a with SMTP id
 j35-20020a05600c1c2300b003f73e85036amr308624wms.7.1693236939945; Mon, 28 Aug
 2023 08:35:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230824153233.1006420-1-dianders@chromium.org>
 <20230824083012.v11.1.I1223c11c88937bd0cbd9b086d4ef216985797302@changeid>
 <86bkeuf5tm.wl-maz@kernel.org>
In-Reply-To: <86bkeuf5tm.wl-maz@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 28 Aug 2023 08:35:27 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VaF2ebXX12CY4ZSnj4rSbes9vruBkKf-F6ZdaHBCqkqQ@mail.gmail.com>
Message-ID: <CAD=FV=VaF2ebXX12CY4ZSnj4rSbes9vruBkKf-F6ZdaHBCqkqQ@mail.gmail.com>
To: Marc Zyngier <maz@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hi, On Sat, Aug 26, 2023 at 3:37 AM Marc Zyngier <maz@kernel.org>
    wrote: > > On Thu, 24 Aug 2023 16:30:27 +0100, > Douglas Anderson <dianders@chromium.org>
    wrote: > > > > As of commit 6abbd6988971 ("irq [...] 
 
 Content analysis details:   (-0.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.218.47 listed in list.dnswl.org]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.218.47 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qaeHN-000t63-I8
Subject: Re: [Kgdb-bugreport] [PATCH v11 1/6] irqchip/gic-v3: Enable support
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Daniel Thompson <daniel.thompson@linaro.org>, ito-yuichi@fujitsu.com,
 Lecopzer Chen <lecopzer.chen@mediatek.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 linux-kernel@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
 linux-perf-users@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
 kgdb-bugreport@lists.sourceforge.net, Thomas Gleixner <tglx@linutronix.de>,
 Masayoshi Mizuma <msys.mizuma@gmail.com>, Will Deacon <will@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

SGksCgpPbiBTYXQsIEF1ZyAyNiwgMjAyMyBhdCAzOjM34oCvQU0gTWFyYyBaeW5naWVyIDxtYXpA
a2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBUaHUsIDI0IEF1ZyAyMDIzIDE2OjMwOjI3ICswMTAw
LAo+IERvdWdsYXMgQW5kZXJzb24gPGRpYW5kZXJzQGNocm9taXVtLm9yZz4gd3JvdGU6Cj4gPgo+
ID4gQXMgb2YgY29tbWl0IDZhYmJkNjk4ODk3MSAoImlycWNoaXAvZ2ljLCBnaWMtdjM6IE1ha2Ug
U0dJcyB1c2UKPiA+IGhhbmRsZV9wZXJjcHVfZGV2aWRfaXJxKCkiKSBTR0lzIGFyZSB0cmVhdGVk
IHRoZSBzYW1lIGFzIFBQSXMvRVBQSXMKPiA+IGFuZCB1c2UgaGFuZGxlX3BlcmNwdV9kZXZpZF9p
cnEoKSBieSBkZWZhdWx0LiBVbmZvcnR1bmF0ZWx5LAo+ID4gaGFuZGxlX3BlcmNwdV9kZXZpZF9p
cnEoKSBpc24ndCBOTUkgc2FmZSwgYW5kIHNvIHRvIHJ1biBpbiBhbiBOTUkKPiA+IGNvbnRleHQg
dGhvc2Ugc2hvdWxkIHVzZSBoYW5kbGVfcGVyY3B1X2RldmlkX2Zhc3Rlb2lfbm1pKCkuCj4gPgo+
ID4gSW4gb3JkZXIgdG8gYWNjb21wbGlzaCB0aGlzLCB3ZSBqdXN0IGhhdmUgdG8gbWFrZSByb29t
IGZvciBTR0lzIGluIHRoZQo+ID4gYXJyYXkgb2YgcmVmY291bnRzIHRoYXQga2VlcHMgdHJhY2sg
b2Ygd2hpY2ggaW50ZXJydXB0cyBhcmUgc2V0IGFzCj4gPiBOTUkuIFdlIGFsc28gcmVuYW1lIHRo
ZSBhcnJheSBhbmQgY3JlYXRlIGEgbmV3IGluZGV4aW5nIHNjaGVtZSB0aGF0Cj4gPiBhY2NvdW50
cyBmb3IgU0dJcy4KPiA+Cj4gPiBBbHNvLCBlbmFibGUgTk1JIHN1cHBvcnQgcHJpb3IgdG8gZ2lj
X3NtcF9pbml0KCkgYXMgYWxsb2NhdGlvbiBvZiBTR0lzCj4gPiBhcyBJUlFzL05NSXMgaGFwcGVu
IGFzIHBhcnQgb2YgdGhpcyByb3V0aW5lLgo+ID4KPiA+IENvLWRldmVsb3BlZC1ieTogU3VtaXQg
R2FyZyA8c3VtaXQuZ2FyZ0BsaW5hcm8ub3JnPgo+ID4gU2lnbmVkLW9mZi1ieTogU3VtaXQgR2Fy
ZyA8c3VtaXQuZ2FyZ0BsaW5hcm8ub3JnPgo+ID4gU2lnbmVkLW9mZi1ieTogRG91Z2xhcyBBbmRl
cnNvbiA8ZGlhbmRlcnNAY2hyb21pdW0ub3JnPgo+ID4gLS0tCj4gPiBJbiB2MTAgSSByZW1vdmVk
IHRoZSBwcmV2aW91cyBSZXZpZXdlZC1ieSBhbmQgVGVzdGVkLWJ5IHRhZ3Mgc2luY2UgdGhlCj4g
PiBwYXRjaCBjb250ZW50cyBjaGFuZ2VkIHByZXR0eSBkcmFzdGljYWxseS4KPiA+Cj4gPiBJJ2xs
IGFsc28gbm90ZSB0aGF0IHRoaXMgY2hhbmdlIGlzIGEgbGl0dGxlIG1vcmUgYmxhY2sgbWFnaWMg
dG8gbWUKPiA+IHRoYW4gb3RoZXJzIGluIHRoaXMgc2VyaWVzLiBJIGRvbid0IGhhdmUgYSBtYXNz
aXZlIGFtb3VudHMgb2YKPiA+IGZhbWlsaWFyaXR5IHdpdGggYWxsIHRoZSBtb3ZpbmcgcGFydHMg
b2YgZ2ljLXYzLCBzbyBJIG1vc3RseSBqdXN0Cj4gPiBmb2xsb3dlZCBNYXJrIFJ1dGxhbmQncyBh
ZHZpY2UgWzFdLiBQbGVhc2UgcGF5IGV4dHJhIGF0dGVudGlvbiB0byBtYWtlCj4gPiBzdXJlIEkg
ZGlkbid0IGRvIGFueXRoaW5nIHRvbyB0ZXJyaWJsZS4KPiA+Cj4gPiBNYXJrJ3MgYWR2aWNlIHdh
c24ndCBhIGZ1bGwgcGF0Y2ggYW5kIEkgZW5kZWQgdXAgZG9pbmcgYSBiaXQgb2Ygd29yawo+ID4g
dG8gdHJhbnNsYXRlIGl0IHRvIHJlYWxpdHksIHNvIEkgZGlkIG5vdCBhZGQgaGltIGFzICJDby1k
ZXZlbG9wZWQtYnkiCj4gPiBoZXJlLiBNYXJrOiBpZiB5b3Ugd291bGQgbGlrZSB0aGlzIHRhZyB0
aGVuIHBsZWFzZSBwcm92aWRlIGl0IGFuZCB5b3VyCj4gPiBTaWduZWQtb2ZmLWJ5LiBJIGNlcnRh
aW5seSB3b24ndCBvYmplY3QuCj4gPgo+ID4gWzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3Iv
Wk5DLVlSUW9wTzBQYUlJb0BGVkZGNzdTMFEwNU4uY2FtYnJpZGdlLmFybS5jb20KPiA+Cj4gPiAo
bm8gY2hhbmdlcyBzaW5jZSB2MTApCj4gPgo+ID4gQ2hhbmdlcyBpbiB2MTA6Cj4gPiAtIFJld3Jp
dGUgYXMgbmVlZGVkIGZvciA1LjExKyBhcyBwZXIgTWFyayBSdXRsYW5kIGFuZCBTdW1pdC4KPiA+
Cj4gPiAgZHJpdmVycy9pcnFjaGlwL2lycS1naWMtdjMuYyB8IDU0ICsrKysrKysrKysrKysrKysr
KysrKysrKy0tLS0tLS0tLS0tLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAzNiBpbnNlcnRpb25zKCsp
LCAxOCBkZWxldGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pcnFjaGlwL2ly
cS1naWMtdjMuYyBiL2RyaXZlcnMvaXJxY2hpcC9pcnEtZ2ljLXYzLmMKPiA+IGluZGV4IGVlZGZh
OGU5ZjA3Ny4uNDlkMThjZjNmNjM2IDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9pcnFjaGlwL2ly
cS1naWMtdjMuYwo+ID4gKysrIGIvZHJpdmVycy9pcnFjaGlwL2lycS1naWMtdjMuYwo+ID4gQEAg
LTc4LDYgKzc4LDggQEAgc3RhdGljIERFRklORV9TVEFUSUNfS0VZX1RSVUUoc3VwcG9ydHNfZGVh
Y3RpdmF0ZV9rZXkpOwo+ID4gICNkZWZpbmUgR0lDX0xJTkVfTlIgIG1pbihHSUNEX1RZUEVSX1NQ
SVMoZ2ljX2RhdGEucmRpc3RzLmdpY2RfdHlwZXIpLCAxMDIwVSkKPiA+ICAjZGVmaW5lIEdJQ19F
U1BJX05SICBHSUNEX1RZUEVSX0VTUElTKGdpY19kYXRhLnJkaXN0cy5naWNkX3R5cGVyKQo+ID4K
PiA+ICsjZGVmaW5lIFNHSV9OUiAgICAgICAgICAgICAgIDE2Cj4KPiBXaHkgMTY/IFdlIG9ubHkg
YWxsb2NhdGUgOCwgYXMgdGhlIG90aGVyIDggYXJlIHBvdGVudGlhbGx5IHN0b2xlbiBieQo+IHRo
ZSBzZWN1cmUgc2lkZS4gV2UgZG8gdHJ5IGFuZCBpbml0aWFsaXNlIHRoZW0gYWxsIHNvIHRoYXQg
dGhleSBoYXZlIGEKPiBrbm93biBzdGF0ZSBpZiB0aGV5IHdlcmUgYWN0dWFsbHkgY29uZmlndXJl
ZCBhcyBHcm91cC0xTlMsIGJ1dCB3ZQo+IGRvbid0IHVzZSB0aGVtLgo+Cj4gSSB1bmRlcnN0YW5k
IHRoYXQgdGhpcyBzaW1wbGlmaWVzIHRoZSBpbmRleGluZyBpbiB0aGUgcmRpc3Rfbm1pX3JlZnMK
PiBhcnJheSBhbmQgSSdtIG5vdCBnb2luZyB0byBjcnkgb3ZlciAzMiB3YXN0ZWQgYnl0ZXMsIGJ1
dCB0aGlzCj4gZGVmaW5pdGVseSBkZXNlcnZlcyBhIGNvbW1lbnQuCgpHb29kIHBvaW50LiBJJ2xs
IHBsYW4gdG8gd2FpdCBhbm90aGVyIGRheSBvciB0d28gdG8gc2VlIGlmIGFueSBvdGhlcgpmZWVk
YmFjayBzaG93cyB1cCBhbmQgdGhlbiBzZW5kIGEgdjEyIHdpdGggdGhpcyBwbHVzIFN0ZXBoZW4n
cyBuaXQKZml4ZXMgb24gb25lIG9mIHRoZSBvdGhlciBwYXRjaGVzLgoKLURvdWcKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpLZ2RiLWJ1Z3JlcG9ydCBt
YWlsaW5nIGxpc3QKS2dkYi1idWdyZXBvcnRAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8v
bGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2tnZGItYnVncmVwb3J0Cg==
