Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 949AC78F05E
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 31 Aug 2023 17:32:08 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1qbjeQ-0003mr-Ax
	for lists+kgdb-bugreport@lfdr.de;
	Thu, 31 Aug 2023 15:32:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1qbjeO-0003ml-S2
 for kgdb-bugreport@lists.sourceforge.net;
 Thu, 31 Aug 2023 15:32:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OkBoG7R/Bh/kZjYjKo0ralsC3KC777LpPg9zwJWSmVg=; b=HwpamkgS85/0aPNlu6psmERrqm
 Ac9TeIvPLZIou/o/w1E0gKMQJ/IjvInJYaRPSHCYpBuvcVJ5B+qhL7/8TUHg/M9QkyDPpRv1Ejrfa
 +7ku+hubdvQ9U6DWOO3gkoRQEKMPnqCM3inCmoz8mdAm4Qe0QFBFgAbTZJhpt1aUODVg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=OkBoG7R/Bh/kZjYjKo0ralsC3KC777LpPg9zwJWSmVg=; b=IOYrEAkQhh9LEtHBGQl7tl9umj
 APIY5f6zeWIArxvnc0gmMBe5u9xPMtjLPdIYflBRTK1JeydKLPd+auvtFEEzznDLShoAk/dNQodJP
 8xR5dDoYCtPB8h4amg9PfgeTV2dEQrbRCRev15s5Iheilz2Z+ZNtE59EeIvLLY6Gm50s=;
Received: from mail-ed1-f43.google.com ([209.85.208.43])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qbjeL-004rX9-8d for kgdb-bugreport@lists.sourceforge.net;
 Thu, 31 Aug 2023 15:32:05 +0000
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-52683da3f5cso1227941a12.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 31 Aug 2023 08:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1693495914; x=1694100714;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OkBoG7R/Bh/kZjYjKo0ralsC3KC777LpPg9zwJWSmVg=;
 b=BECELW8HMuIdCo911fk1KjYKTw3u8WtHY6kCYmNEGjYUoj5tyEXHz1lxE1BVLaXvDW
 jbgT3EZmTQc9zaNtmFrb/VoA0VoDJLYL+Odi5jCt1iSP9k635jIdnpOjDilxrpAafoeo
 HLI1JYl5LAJrjWaCPYWoa0O8K8OodCO90QPn8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693495914; x=1694100714;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OkBoG7R/Bh/kZjYjKo0ralsC3KC777LpPg9zwJWSmVg=;
 b=UHy2Vv9XBcxgmXo+wd3JGtGgjIOy2sqFNMw2f7e4Pm0Yenv7VVoM6Xi1qdG03onOJH
 VECv1dDWAVv5RugNL/n7oudKyDJMJ/2+8Nmkn7+uLIiPcLgn/o0QvmA+RB2V+HsbSUdY
 EC1F6rHQo6e22jt9gKBpk3E7IhNYPcjTIMZHuwes6rAwCiU9GXmE0bf87j2Ray72TuS2
 ipYnKt4vSxOBffZDssBJ2+6akHVL4tpcUvMHt9A9lPkHJqb3ghaqKy6TFif9T8eF7WWT
 B9t77jkAZvNMq18GO0E9G2hc7zTh+MXG4/NQgb1R7Jd5657v4udI0LTBFhPC1bG44uTB
 bghg==
X-Gm-Message-State: AOJu0YxXB4OJP1aBJTxaWkBm43OuVRDYx3Se8AGS2z71NOzOuOiE8ex6
 sYTP29oINS5CdLtCjNccRS3K6L6mFF1xrpblR0MEphfG
X-Google-Smtp-Source: AGHT+IHSp2okLtnafP1DGtxohw0BhGv+WdVxq5YoK3BSxl1wW9SWN3D1zkUNM91eAIuNf7BGL0puvQ==
X-Received: by 2002:a05:6402:2c4:b0:52a:1d54:2534 with SMTP id
 b4-20020a05640202c400b0052a1d542534mr4589708edx.25.1693495913930; 
 Thu, 31 Aug 2023 08:31:53 -0700 (PDT)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com.
 [209.85.128.43]) by smtp.gmail.com with ESMTPSA id
 d26-20020a50fb1a000000b0052574ef0da1sm899438edq.28.2023.08.31.08.31.53
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Aug 2023 08:31:53 -0700 (PDT)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-4009fdc224dso85615e9.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 31 Aug 2023 08:31:53 -0700 (PDT)
X-Received: by 2002:a05:600c:364f:b0:3fe:f32f:c57f with SMTP id
 y15-20020a05600c364f00b003fef32fc57fmr169559wmq.0.1693495913002; Thu, 31 Aug
 2023 08:31:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230830191314.1618136-1-dianders@chromium.org>
 <20230830121115.v12.1.I1223c11c88937bd0cbd9b086d4ef216985797302@changeid>
 <ZPBVB_z3FTl2nBy0@FVFF77S0Q05N>
In-Reply-To: <ZPBVB_z3FTl2nBy0@FVFF77S0Q05N>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 31 Aug 2023 08:31:37 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V3-XaT_KsJXwUXVuaXfx-RfbW3ehW4JJcvWLsty_9fcA@mail.gmail.com>
Message-ID: <CAD=FV=V3-XaT_KsJXwUXVuaXfx-RfbW3ehW4JJcvWLsty_9fcA@mail.gmail.com>
To: Mark Rutland <mark.rutland@arm.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hi, On Thu, Aug 31, 2023 at 1:53 AM Mark Rutland <mark.rutland@arm.com>
    wrote: > > On Wed, Aug 30, 2023 at 12:11:22PM -0700, Douglas Anderson wrote:
    > > As of commit 6abbd6988971 ("irqchip/gic, gic-v3: [...] 
 
 Content analysis details:   (-0.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.208.43 listed in list.dnswl.org]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.208.43 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qbjeL-004rX9-8d
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
 kgdb-bugreport@lists.sourceforge.net,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 linux-kernel@vger.kernel.org, Stephane Eranian <eranian@google.com>,
 Stephen Boyd <swboyd@chromium.org>, linux-perf-users@vger.kernel.org,
 Chen-Yu Tsai <wens@csie.org>, Marc Zyngier <maz@kernel.org>,
 Tomohiro Misono <misono.tomohiro@fujitsu.com>,
 Thomas Gleixner <tglx@linutronix.de>, Masayoshi Mizuma <msys.mizuma@gmail.com>,
 Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

SGksCgpPbiBUaHUsIEF1ZyAzMSwgMjAyMyBhdCAxOjUz4oCvQU0gTWFyayBSdXRsYW5kIDxtYXJr
LnJ1dGxhbmRAYXJtLmNvbT4gd3JvdGU6Cj4KPiBPbiBXZWQsIEF1ZyAzMCwgMjAyMyBhdCAxMjox
MToyMlBNIC0wNzAwLCBEb3VnbGFzIEFuZGVyc29uIHdyb3RlOgo+ID4gQXMgb2YgY29tbWl0IDZh
YmJkNjk4ODk3MSAoImlycWNoaXAvZ2ljLCBnaWMtdjM6IE1ha2UgU0dJcyB1c2UKPiA+IGhhbmRs
ZV9wZXJjcHVfZGV2aWRfaXJxKCkiKSBTR0lzIGFyZSB0cmVhdGVkIHRoZSBzYW1lIGFzIFBQSXMv
RVBQSXMKPiA+IGFuZCB1c2UgaGFuZGxlX3BlcmNwdV9kZXZpZF9pcnEoKSBieSBkZWZhdWx0LiBV
bmZvcnR1bmF0ZWx5LAo+ID4gaGFuZGxlX3BlcmNwdV9kZXZpZF9pcnEoKSBpc24ndCBOTUkgc2Fm
ZSwgYW5kIHNvIHRvIHJ1biBpbiBhbiBOTUkKPiA+IGNvbnRleHQgdGhvc2Ugc2hvdWxkIHVzZSBo
YW5kbGVfcGVyY3B1X2RldmlkX2Zhc3Rlb2lfbm1pKCkuCj4gPgo+ID4gSW4gb3JkZXIgdG8gYWNj
b21wbGlzaCB0aGlzLCB3ZSBqdXN0IGhhdmUgdG8gbWFrZSByb29tIGZvciBTR0lzIGluIHRoZQo+
ID4gYXJyYXkgb2YgcmVmY291bnRzIHRoYXQga2VlcHMgdHJhY2sgb2Ygd2hpY2ggaW50ZXJydXB0
cyBhcmUgc2V0IGFzCj4gPiBOTUkuIFdlIGFsc28gcmVuYW1lIHRoZSBhcnJheSBhbmQgY3JlYXRl
IGEgbmV3IGluZGV4aW5nIHNjaGVtZSB0aGF0Cj4gPiBhY2NvdW50cyBmb3IgU0dJcy4KPiA+Cj4g
PiBBbHNvLCBlbmFibGUgTk1JIHN1cHBvcnQgcHJpb3IgdG8gZ2ljX3NtcF9pbml0KCkgYXMgYWxs
b2NhdGlvbiBvZiBTR0lzCj4gPiBhcyBJUlFzL05NSXMgaGFwcGVuIGFzIHBhcnQgb2YgdGhpcyBy
b3V0aW5lLgo+ID4KPiA+IENvLWRldmVsb3BlZC1ieTogU3VtaXQgR2FyZyA8c3VtaXQuZ2FyZ0Bs
aW5hcm8ub3JnPgo+ID4gU2lnbmVkLW9mZi1ieTogU3VtaXQgR2FyZyA8c3VtaXQuZ2FyZ0BsaW5h
cm8ub3JnPgo+ID4gU2lnbmVkLW9mZi1ieTogRG91Z2xhcyBBbmRlcnNvbiA8ZGlhbmRlcnNAY2hy
b21pdW0ub3JnPgo+ID4gLS0tCj4gPiBJJ2xsIG5vdGUgdGhhdCB0aGlzIGNoYW5nZSBpcyBhIGxp
dHRsZSBtb3JlIGJsYWNrIG1hZ2ljIHRvIG1lIHRoYW4KPiA+IG90aGVycyBpbiB0aGlzIHNlcmll
cy4gSSBkb24ndCBoYXZlIGEgbWFzc2l2ZSBhbW91bnRzIG9mIGZhbWlsaWFyaXR5Cj4gPiB3aXRo
IGFsbCB0aGUgbW92aW5nIHBhcnRzIG9mIGdpYy12Mywgc28gSSBtb3N0bHkganVzdCBmb2xsb3dl
ZCBNYXJrCj4gPiBSdXRsYW5kJ3MgYWR2aWNlIFsxXS4gUGxlYXNlIHBheSBleHRyYSBhdHRlbnRp
b24gdG8gbWFrZSBzdXJlIEkgZGlkbid0Cj4gPiBkbyBhbnl0aGluZyB0b28gdGVycmlibGUuCj4g
Pgo+ID4gTWFyaydzIGFkdmljZSB3YXNuJ3QgYSBmdWxsIHBhdGNoIGFuZCBJIGVuZGVkIHVwIGRv
aW5nIGEgYml0IG9mIHdvcmsKPiA+IHRvIHRyYW5zbGF0ZSBpdCB0byByZWFsaXR5LCBzbyBJIGRp
ZCBub3QgYWRkIGhpbSBhcyAiQ28tZGV2ZWxvcGVkLWJ5Igo+ID4gaGVyZS4gTWFyazogaWYgeW91
IHdvdWxkIGxpa2UgdGhpcyB0YWcgdGhlbiBwbGVhc2UgcHJvdmlkZSBpdCBhbmQgeW91cgo+ID4g
U2lnbmVkLW9mZi1ieS4gSSBjZXJ0YWlubHkgd29uJ3Qgb2JqZWN0Lgo+Cj4gVGhhdCdzIGFsbCBy
ZWFzb25hYmxlLCBhbmQgSSdtIHBlcmZlY3RseSBoYXBweSB3aXRob3V0IGEgdGFnLgo+Cj4gSSBo
YXZlIG9uZSB0cml2aWFsIG5pdCBiZWxvdywgYnV0IHdpdGggb3Igd2l0aG91dCB0aGF0IGZpeGVk
IHVwOgo+Cj4gQWNrZWQtYnk6IE1hcmsgUnV0bGFuZCA8bWFyay5ydXRsYW5kQGFybS5jb20+Cj4K
PiA+Cj4gPiBbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci9aTkMtWVJRb3BPMFBhSUlvQEZW
RkY3N1MwUTA1Ti5jYW1icmlkZ2UuYXJtLmNvbQo+ID4KPiA+IENoYW5nZXMgaW4gdjEyOgo+ID4g
LSBBZGRlZCBhIGNvbW1lbnQgYWJvdXQgd2h5IHdlIGFjY291bnQgZm9yIDE2IFNHSXMgd2hlbiBM
aW51eCB1c2VzIDguCj4gPgo+ID4gQ2hhbmdlcyBpbiB2MTA6Cj4gPiAtIFJld3JpdGUgYXMgbmVl
ZGVkIGZvciA1LjExKyBhcyBwZXIgTWFyayBSdXRsYW5kIGFuZCBTdW1pdC4KPiA+Cj4gPiAgZHJp
dmVycy9pcnFjaGlwL2lycS1naWMtdjMuYyB8IDU5ICsrKysrKysrKysrKysrKysrKysrKysrKyst
LS0tLS0tLS0tLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA0MSBpbnNlcnRpb25zKCspLCAxOCBkZWxl
dGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pcnFjaGlwL2lycS1naWMtdjMu
YyBiL2RyaXZlcnMvaXJxY2hpcC9pcnEtZ2ljLXYzLmMKPiA+IGluZGV4IGVlZGZhOGU5ZjA3Ny4u
OGQyMDEyMmJhMGE4IDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9pcnFjaGlwL2lycS1naWMtdjMu
Ywo+ID4gKysrIGIvZHJpdmVycy9pcnFjaGlwL2lycS1naWMtdjMuYwo+ID4gQEAgLTc4LDYgKzc4
LDEzIEBAIHN0YXRpYyBERUZJTkVfU1RBVElDX0tFWV9UUlVFKHN1cHBvcnRzX2RlYWN0aXZhdGVf
a2V5KTsKPiA+ICAjZGVmaW5lIEdJQ19MSU5FX05SICBtaW4oR0lDRF9UWVBFUl9TUElTKGdpY19k
YXRhLnJkaXN0cy5naWNkX3R5cGVyKSwgMTAyMFUpCj4gPiAgI2RlZmluZSBHSUNfRVNQSV9OUiAg
R0lDRF9UWVBFUl9FU1BJUyhnaWNfZGF0YS5yZGlzdHMuZ2ljZF90eXBlcikKPiA+Cj4gPiArLyoK
PiA+ICsgKiBUaGVyZSBhcmUgMTYgU0dJcywgdGhvdWdoIHdlIG9ubHkgYWN0dWFsbHkgdXNlIDgg
aW4gTGludXguIFRoZSBvdGhlciA4IFNHSXMKPiA+ICsgKiBhcmUgcG90ZW50aWFsbHkgc3RvbGVu
IGJ5IHRoZSBzZWN1cmUgc2lkZS4gU29tZSBjb2RlLCBlc3BlY2lhbGx5IGNvZGUgZGVhbGluZwo+
ID4gKyAqIHdpdGggaHdpcnEgSURzLCBpcyBzaW1wbGlmaWVkIGJ5IGFjY291bnRpbmcgZm9yIGFs
bCAxNi4KPiA+ICsgKi8KPiA+ICsjZGVmaW5lIFNHSV9OUiAgICAgICAgICAgICAgIDE2Cj4gPiAr
Cj4gPiAgLyoKPiA+ICAgKiBUaGUgYmVoYXZpb3VycyBvZiBSUFIgYW5kIFBNUiByZWdpc3RlcnMg
ZGlmZmVyIGRlcGVuZGluZyBvbiB0aGUgdmFsdWUgb2YKPiA+ICAgKiBTQ1JfRUwzLkZJUSwgYW5k
IHRoZSBiZWhhdmlvdXIgb2Ygbm9uLXNlY3VyZSBwcmlvcml0eSByZWdpc3RlcnMgb2YgdGhlCj4g
PiBAQCAtMTI1LDggKzEzMiw4IEBAIEVYUE9SVF9TWU1CT0woZ2ljX25vbnNlY3VyZV9wcmlvcml0
aWVzKTsKPiA+ICAgICAgICAgICAgICAgX19wcmlvcml0eTsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBcCj4gPiAgICAgICB9KQo+ID4KPiA+IC0vKiBwcGlfbm1p
X3JlZnNbbl0gPT0gbnVtYmVyIG9mIGNwdXMgaGF2aW5nIHBwaVtuICsgMTZdIHNldCBhcyBOTUkg
Ki8KPiA+IC1zdGF0aWMgcmVmY291bnRfdCAqcHBpX25taV9yZWZzOwo+ID4gKy8qIHJkaXN0X25t
aV9yZWZzW25dID09IG51bWJlciBvZiBjcHVzIGhhdmluZyB0aGUgcmRpc3QgaW50ZXJydXB0IG4g
c2V0IGFzIE5NSSAqLwo+ID4gK3N0YXRpYyByZWZjb3VudF90ICpyZGlzdF9ubWlfcmVmczsKPiA+
Cj4gPiAgc3RhdGljIHN0cnVjdCBnaWNfa3ZtX2luZm8gZ2ljX3YzX2t2bV9pbmZvIF9faW5pdGRh
dGE7Cj4gPiAgc3RhdGljIERFRklORV9QRVJfQ1BVKGJvb2wsIGhhc19yc3MpOwo+ID4gQEAgLTUx
OSw5ICs1MjYsMjIgQEAgc3RhdGljIHUzMiBfX2dpY19nZXRfcHBpX2luZGV4KGlycV9od19udW1i
ZXJfdCBod2lycSkKPiA+ICAgICAgIH0KPiA+ICB9Cj4gPgo+ID4gLXN0YXRpYyB1MzIgZ2ljX2dl
dF9wcGlfaW5kZXgoc3RydWN0IGlycV9kYXRhICpkKQo+ID4gK3N0YXRpYyB1MzIgX19naWNfZ2V0
X3JkaXN0X2lkeChpcnFfaHdfbnVtYmVyX3QgaHdpcnEpCj4gPiArewo+ID4gKyAgICAgc3dpdGNo
IChfX2dldF9pbnRpZF9yYW5nZShod2lycSkpIHsKPiA+ICsgICAgIGNhc2UgU0dJX1JBTkdFOgo+
ID4gKyAgICAgY2FzZSBQUElfUkFOR0U6Cj4gPiArICAgICAgICAgICAgIHJldHVybiBod2lycTsK
PiA+ICsgICAgIGNhc2UgRVBQSV9SQU5HRToKPiA+ICsgICAgICAgICAgICAgcmV0dXJuIGh3aXJx
IC0gRVBQSV9CQVNFX0lOVElEICsgMzI7Cj4gPiArICAgICBkZWZhdWx0Ogo+ID4gKyAgICAgICAg
ICAgICB1bnJlYWNoYWJsZSgpOwo+ID4gKyAgICAgfQo+ID4gK30KPiA+ICsKPiA+ICtzdGF0aWMg
dTMyIGdpY19nZXRfcmRpc3RfaWR4KHN0cnVjdCBpcnFfZGF0YSAqZCkKPiA+ICB7Cj4gPiAtICAg
ICByZXR1cm4gX19naWNfZ2V0X3BwaV9pbmRleChkLT5od2lycSk7Cj4gPiArICAgICByZXR1cm4g
X19naWNfZ2V0X3JkaXN0X2lkeChkLT5od2lycSk7Cj4gPiAgfQo+Cj4gTml0OiBJdCB3b3VsZCBi
ZSBuaWNlciB0byBjYWxsIHRoaXMgZ2ljX2dldF9yZGlzdF9pbmRleCgpIHRvIG1hdGNoCj4gZ2lj
X2dldF9wcGlfaW5kZXgoKTsgbGlrZXdpc2Ugd2l0aCBfX2dpY19nZXRfcmRpc3RfaW5kZXgoKS4K
Pgo+IFRoYXQncyBteSBmYXVsdCBnaXZlbiBJIHN1Z2dlc3RlZCB0aGUgZ2ljX2dldF9yZGlzdF9p
ZHgoKSBuYW1lIGluOgo+Cj4gICBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1hcm0ta2Vy
bmVsL1pOQy1ZUlFvcE8wUGFJSW9ARlZGRjc3UzBRMDVOLmNhbWJyaWRnZS5hcm0uY29tLwo+Cj4g
Li4uIHNvIHNvcnJ5IGFib3V0IHRoYXQhCgpZZWFoLCBJIGtlcHQgdGhlIG5hbWUgeW91IHN1Z2dl
c3RlZCBldmVuIHRob3VnaCBpdCBzZWVtZWQgYSBsaXR0bGUKaW5jb25zaXN0ZW50LiBJJ2xsIGhh
cHBpbHkgc2VuZCBhIHYxMyB3aXRoIHRoYXQgZml4ZWQgdXAsIHRob3VnaCBJJ2xsCnByb2JhYmx5
IHdhaXQgYSBsaXR0bGUgYml0IGp1c3QgdG8gYXZvaWQgc3BhbW1pbmcgbmV3IHZlcnNpb25zIHRv
bwpxdWlja2x5LiBJdCdzIG5vdCBsaWtlIHRoZSBwYXRjaGVzIGNhbiBsYW5kIGluIHRoZSBtaWRk
bGUgb2YgdGhlIG1lcmdlCndpbmRvdyBhbnl3YXkuCgpVbmxlc3Mgc29tZW9uZSBzYXlzIG90aGVy
d2lzZSwgSSBndWVzcyB0aGlzIHNlcmllcyBpcyBpbiBnb29kIHNoYXBlIHRvCmxhbmQgdGhlbi4g
RG9lcyBhbnlvbmUgaGF2ZSBhbnkgcGxhbnMgZm9yIHRoZSBkZXRhaWxzIG9mIGhvdyB0byBsYW5k
Cml0PyBJIGd1ZXNzIHRoaXMgd291bGQgYmUgc29tZXRoaW5nIHRoYXQgTWFyYywgQ2F0YWxpbiBh
bmQgV2lsbCB3b3VsZApuZWVkIHRvIGhhc2ggb3V0IHNpbmNlIHRoZSBmaXJzdCBwYXRjaCB3b3Vs
ZCBpZGVhbGx5IGdvIHRocm91Z2ggYQpkaWZmZXJlbnQgdHJlZSB0aGFuIHRoZSBvdGhlcnMuCgot
RG91ZwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCktn
ZGItYnVncmVwb3J0IG1haWxpbmcgbGlzdApLZ2RiLWJ1Z3JlcG9ydEBsaXN0cy5zb3VyY2Vmb3Jn
ZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8va2dkYi1i
dWdyZXBvcnQK
