Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 891C5783698
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 22 Aug 2023 02:13:28 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1qYF1S-0006X4-RQ
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 22 Aug 2023 00:13:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1qYF1S-0006Wy-3e
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 22 Aug 2023 00:13:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7J3x0Gt197keDgNUTYsLDArxgf8balIGee5TfL+T5L0=; b=E2MKp/RTacvM/uhrQvVNDj7M3P
 z9OjN5CKbld0nDliU4CaMfYqrwJsr7UnrCgdsigsXtFqflGjckXOxVbyLwpeY9f0s8cJ3aaQQ+pzu
 2VttHlgjSsnt/La44CJTz6fbCnemWoqh7gXBJo9+DhxABtiR0phrjaPedp68lXSSl3es=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7J3x0Gt197keDgNUTYsLDArxgf8balIGee5TfL+T5L0=; b=k7Sg6pxtcMxYBhozd5vjIsUuEr
 82cBXlo7644KOCJRtrGOevHbKjileVzic6pBtW05OMOnni2tdmCOwroiHg0ax42s4yJyDLRcWj2pv
 xFuGhkcQvUpIv3W/J/kOwF6zVBe0xPyeiqCIMFG2YQSPlRn4crKHDQjloXLyTk4Tugm0=;
Received: from mail-ed1-f48.google.com ([209.85.208.48])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qYF1R-00BrI8-9W for kgdb-bugreport@lists.sourceforge.net;
 Tue, 22 Aug 2023 00:13:26 +0000
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-5257e2b5d12so4623865a12.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 21 Aug 2023 17:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1692663199; x=1693267999;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7J3x0Gt197keDgNUTYsLDArxgf8balIGee5TfL+T5L0=;
 b=e30ueOS7gbkMkDtELFo3kkflHIiWw2bpMHHX4CNtPp9tNDkRTyzPNU/OHqHnyTl+Cz
 qV8UKAGOTC9jO5tTXPCOAlDFci+FIJDG0a6umBo5bmU/xWHv5aqeS1jQGir3p8KPfL9s
 qrg+BU4/wePLIr4tG+Q37UrANlFBdNDsrFJIg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692663199; x=1693267999;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7J3x0Gt197keDgNUTYsLDArxgf8balIGee5TfL+T5L0=;
 b=ZejPRfeizvm0PnT7pNvVier3Ay2JjhP0xVtpWK3qZG9GH1jaO/YP8AGjod8KAskWKM
 C5VsJgZOKMgvNHHhYYKDazO01AE8r/onnv1UGM1QfEIGKxuiDo9/8Hl22f8rQqfPG4o8
 goiY3HykeTkKuPwhoAHYBidiAmM6A3WRierj9jk6jN4AyKFRZWcCU72s/DnDTn5v4Fy/
 MoDEQOf5dO3DceObzSXzdzB53I2u0ceEwh2kapkfVVBU0n40D2ghVg9OXn1rb7KdCTvR
 m0NOiMzpL8oTkviKU7JF3Uas/++SnV1RoFkPLwrHyZisO9L6ccY15EUBLKgPrBcY5Tmp
 LzsQ==
X-Gm-Message-State: AOJu0Yzkq8ul1OFcQmFRCG3EfF8gMO7VBL5YEZmiYAEtnEXPEicjxIC9
 oh04IuFh4QkdjwYjTCOynlsQnghCyPiFh7hb4oHR2Y0N
X-Google-Smtp-Source: AGHT+IFmXaN24eNoukoRXW3voVBQqkvfVqLm2j4+7pvh3cXLAZHf49VnJlWetjDX+vwqHRYdmLgnAw==
X-Received: by 2002:adf:f84e:0:b0:315:9362:3c70 with SMTP id
 d14-20020adff84e000000b0031593623c70mr5627033wrq.60.1692662823734; 
 Mon, 21 Aug 2023 17:07:03 -0700 (PDT)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com.
 [209.85.208.43]) by smtp.gmail.com with ESMTPSA id
 d19-20020aa7c1d3000000b005232ea6a330sm6729733edp.2.2023.08.21.17.07.03
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Aug 2023 17:07:03 -0700 (PDT)
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-51e24210395so5720a12.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 21 Aug 2023 17:07:03 -0700 (PDT)
X-Received: by 2002:a50:8757:0:b0:51a:1ffd:10e with SMTP id
 23-20020a508757000000b0051a1ffd010emr19923edv.3.1692662823330; Mon, 21 Aug
 2023 17:07:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230601213440.2488667-1-dianders@chromium.org>
 <20230601143109.v9.5.I65981105e1f62550b0316625dd1e599deaf9e1aa@changeid>
 <ZNDGMJW01avOMShn@FVFF77S0Q05N.cambridge.arm.com>
In-Reply-To: <ZNDGMJW01avOMShn@FVFF77S0Q05N.cambridge.arm.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 21 Aug 2023 17:06:50 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Wz4Y836__Fo=Va8ek9BLEoTTbYx_zycBuVony37eOGVg@mail.gmail.com>
Message-ID: <CAD=FV=Wz4Y836__Fo=Va8ek9BLEoTTbYx_zycBuVony37eOGVg@mail.gmail.com>
To: Mark Rutland <mark.rutland@arm.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hi, On Mon, Aug 7, 2023 at 3:23 AM Mark Rutland <mark.rutland@arm.com>
    wrote: > > On Thu, Jun 01, 2023 at 02:31:49PM -0700, Douglas Anderson wrote:
    > > From: Sumit Garg <sumit.garg@linaro.org> > > > > E [...] 
 
 Content analysis details:   (-0.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.208.48 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.208.48 listed in wl.mailspike.net]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qYF1R-00BrI8-9W
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

SGksCgpPbiBNb24sIEF1ZyA3LCAyMDIzIGF0IDM6MjPigK9BTSBNYXJrIFJ1dGxhbmQgPG1hcmsu
cnV0bGFuZEBhcm0uY29tPiB3cm90ZToKPgo+IE9uIFRodSwgSnVuIDAxLCAyMDIzIGF0IDAyOjMx
OjQ5UE0gLTA3MDAsIERvdWdsYXMgQW5kZXJzb24gd3JvdGU6Cj4gPiBGcm9tOiBTdW1pdCBHYXJn
IDxzdW1pdC5nYXJnQGxpbmFyby5vcmc+Cj4gPgo+ID4gRW5hYmxlIGFyY2hfdHJpZ2dlcl9jcHVt
YXNrX2JhY2t0cmFjZSgpIHN1cHBvcnQgb24gYXJtNjQgdXNpbmcgdGhlIG5ldwo+ID4gZGVidWcg
SVBJLiBXaXRoIHRoaXMgYXJtNjQgY2FuIG5vdyBnZXQgYmFja3RyYWNlcyBpbiBjYXNlcyB3aGVy
ZQo+ID4gY2FsbGVycyBvZiB0aGUgdHJpZ2dlcl94eXpfYmFja3RyYWNlKCkgY2xhc3Mgb2YgZnVu
Y3Rpb25zIGRvbid0IGNoZWNrCj4gPiB0aGUgcmV0dXJuIGNvZGUgYW5kIGltcGxlbWVudCBhIGZh
bGxiYWNrLiBPbmUgZXhhbXBsZSBpcwo+ID4gYGtlcm5lbC5zb2Z0bG9ja3VwX2FsbF9jcHVfYmFj
a3RyYWNlYC4gVGhpcyBhbHNvIGFsbG93cyB1cyB0bwo+ID4gYmFja3RyYWNlIGhhcmQgbG9ja2Vk
IHVwIENQVXMgaW4gY2FzZXMgd2hlcmUgdGhlIGRlYnVnIElQSSBpcyBiYWNrZWQKPiA+IGJ5IGFu
IE5NSSAob3IgcHNldWRvIE5NSSkuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogU3VtaXQgR2FyZyA8
c3VtaXQuZ2FyZ0BsaW5hcm8ub3JnPgo+ID4gU2lnbmVkLW9mZi1ieTogRG91Z2xhcyBBbmRlcnNv
biA8ZGlhbmRlcnNAY2hyb21pdW0ub3JnPgo+ID4gLS0tCj4gPgo+ID4gQ2hhbmdlcyBpbiB2OToK
PiA+IC0gQWRkZWQgY29tbWVudHMgdGhhdCB3ZSBtaWdodCBub3QgYmUgdXNpbmcgTk1JIGFsd2F5
cy4KPiA+IC0gUmVuYW1lZCAiTk1JIElQSSIgdG8gImRlYnVnIElQSSIgc2luY2UgaXQgbWlnaHQg
bm90IGJlIGJhY2tlZCBieSBOTUkuCj4gPiAtIGFyY2hfdHJpZ2dlcl9jcHVtYXNrX2JhY2t0cmFj
ZSgpIG5vIGxvbmdlciByZXR1cm5zIGJvb2wKPiA+Cj4gPiBDaGFuZ2VzIGluIHY4Ogo+ID4gLSBS
ZW1vdmVkICIjaWZkZWYgQ09ORklHX1NNUCIgc2luY2UgYXJtNjQgaXMgYWx3YXlzIFNNUAo+ID4K
PiA+ICBhcmNoL2FybTY0L2luY2x1ZGUvYXNtL2lycS5oICB8ICAzICsrKwo+ID4gIGFyY2gvYXJt
NjQva2VybmVsL2lwaV9kZWJ1Zy5jIHwgMjUgKysrKysrKysrKysrKysrKysrKysrKystLQo+ID4g
IDIgZmlsZXMgY2hhbmdlZCwgMjYgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPgo+IEFz
IHdpdGggcHJpb3IgcGF0Y2hlcywgSSdkIHByZWZlciBpZiB0aGlzIGxpdmVkIGluIHNtcC5jIHdp
dGggdGhlIG90aGVyIElQSQo+IGxvZ2ljLgo+Cj4gPgo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvYXJt
NjQvaW5jbHVkZS9hc20vaXJxLmggYi9hcmNoL2FybTY0L2luY2x1ZGUvYXNtL2lycS5oCj4gPiBp
bmRleCBmYWMwOGUxOGJjZDUuLmJlMmQxMDNmMzE2ZSAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvYXJt
NjQvaW5jbHVkZS9hc20vaXJxLmgKPiA+ICsrKyBiL2FyY2gvYXJtNjQvaW5jbHVkZS9hc20vaXJx
LmgKPiA+IEBAIC02LDYgKzYsOSBAQAo+ID4KPiA+ICAjaW5jbHVkZSA8YXNtLWdlbmVyaWMvaXJx
Lmg+Cj4gPgo+ID4gK3ZvaWQgYXJjaF90cmlnZ2VyX2NwdW1hc2tfYmFja3RyYWNlKGNvbnN0IGNw
dW1hc2tfdCAqbWFzaywgYm9vbCBleGNsdWRlX3NlbGYpOwo+ID4gKyNkZWZpbmUgYXJjaF90cmln
Z2VyX2NwdW1hc2tfYmFja3RyYWNlIGFyY2hfdHJpZ2dlcl9jcHVtYXNrX2JhY2t0cmFjZQo+ID4g
Kwo+ID4gIHN0cnVjdCBwdF9yZWdzOwo+ID4KPiA+ICBpbnQgc2V0X2hhbmRsZV9pcnEodm9pZCAo
KmhhbmRsZV9pcnEpKHN0cnVjdCBwdF9yZWdzICopKTsKPiA+IGRpZmYgLS1naXQgYS9hcmNoL2Fy
bTY0L2tlcm5lbC9pcGlfZGVidWcuYyBiL2FyY2gvYXJtNjQva2VybmVsL2lwaV9kZWJ1Zy5jCj4g
PiBpbmRleCBiNTc4MzNlMzFlYWYuLjY5ODRlZDUwN2UxZiAxMDA2NDQKPiA+IC0tLSBhL2FyY2gv
YXJtNjQva2VybmVsL2lwaV9kZWJ1Zy5jCj4gPiArKysgYi9hcmNoL2FybTY0L2tlcm5lbC9pcGlf
ZGVidWcuYwo+ID4gQEAgLTgsNiArOCw3IEBACj4gPgo+ID4gICNpbmNsdWRlIDxsaW51eC9pbnRl
cnJ1cHQuaD4KPiA+ICAjaW5jbHVkZSA8bGludXgvaXJxLmg+Cj4gPiArI2luY2x1ZGUgPGxpbnV4
L25taS5oPgo+ID4gICNpbmNsdWRlIDxsaW51eC9zbXAuaD4KPiA+Cj4gPiAgI2luY2x1ZGUgImlw
aV9kZWJ1Zy5oIgo+ID4gQEAgLTI0LDExICsyNSwzMSBAQCB2b2lkIGFybTY0X2RlYnVnX2lwaShj
cHVtYXNrX3QgKm1hc2spCj4gPiAgICAgICBfX2lwaV9zZW5kX21hc2soaXBpX2RlYnVnX2Rlc2Ms
IG1hc2spOwo+ID4gIH0KPiA+Cj4gPiArdm9pZCBhcmNoX3RyaWdnZXJfY3B1bWFza19iYWNrdHJh
Y2UoY29uc3QgY3B1bWFza190ICptYXNrLCBib29sIGV4Y2x1ZGVfc2VsZikKPiA+ICt7Cj4gPiAr
ICAgICAvKgo+ID4gKyAgICAgICogTk9URTogdGhvdWdoIG5taV90cmlnZ2VyX2NwdW1hc2tfYmFj
a3RyYWNlIGhhcyAibm1pXyIgaW4gdGhlIG5hbWUsCj4gPiArICAgICAgKiBub3RoaW5nIGFib3V0
IGl0IHRydWx5IG5lZWRzIHRvIGJlIGJhY2tlZCBieSBhbiBOTUksIGl0J3MganVzdCB0aGF0Cj4g
PiArICAgICAgKiBpdCdzIF9hbGxvd2VkXyB0byBiZSBjYWxsZWQgZnJvbSBhbiBOTUkuIElmIHNl
dF9zbXBfZGVidWdfaXBpKCkKPiA+ICsgICAgICAqIGZhaWxlZCB0byBnZXQgYW4gTk1JIChvciBw
c2V1ZG8tTk1JKSB0aGlzIHdpbGwganVzdCBiZSBiYWNrZWQgYnkgYQo+ID4gKyAgICAgICogcmVn
dWxhciBJUEkuCj4gPiArICAgICAgKi8KPiA+ICsgICAgIG5taV90cmlnZ2VyX2NwdW1hc2tfYmFj
a3RyYWNlKG1hc2ssIGV4Y2x1ZGVfc2VsZiwgYXJtNjRfZGVidWdfaXBpKTsKPiA+ICt9Cj4gPiAr
Cj4gPiAgc3RhdGljIGlycXJldHVybl90IGlwaV9kZWJ1Z19oYW5kbGVyKGludCBpcnEsIHZvaWQg
KmRhdGEpCj4gPiAgewo+ID4gLSAgICAgLyogbm9wLCBOTUkgaGFuZGxlcnMgZm9yIHNwZWNpYWwg
ZmVhdHVyZXMgY2FuIGJlIGFkZGVkIGhlcmUuICovCj4gPiArICAgICBpcnFyZXR1cm5fdCByZXQg
PSBJUlFfTk9ORTsKPiA+ICsKPiA+ICsgICAgIC8qCj4gPiArICAgICAgKiBOT1RFOiBKdXN0IGxp
a2UgaW4gYXJjaF90cmlnZ2VyX2NwdW1hc2tfYmFja3RyYWNlKCksIHdlJ3JlIGNhbGxpbmcKPiA+
ICsgICAgICAqIGEgZnVuY3Rpb24gd2l0aCAibm1pXyIgaW4gdGhlIG5hbWUgYnV0IGl0IHdvcmtz
IGZpbmUgZXZlbiBpZiB3ZQo+ID4gKyAgICAgICogYXJlIHVzaW5nIGEgcmVndWxhb3IgSVBJLgo+
ID4gKyAgICAgICovCj4gPiArICAgICBpZiAobm1pX2NwdV9iYWNrdHJhY2UoZ2V0X2lycV9yZWdz
KCkpKQo+ID4gKyAgICAgICAgICAgICByZXQgPSBJUlFfSEFORExFRDsKPiA+Cj4KPiBEb2VzIHRo
aXMgbmVlZCB0aGUgcHJpbnRrX2RlZmVycmVkX3tlbnRlcixleGl0fSgpIHRoYXQgMzItYml0IGFy
bSBoYXM/CgpJIGRvbid0IF90aGlua18gc28sIGJ1dCBJIGFsc28gZG9uJ3QgX3RoaW5rXyBpdCdz
IG5lZWRlZCBmb3IgYXJtMzIuCjstKSBMZXQgbWUgZXhwbGFpbiBteSBsb2dpYyBhbmQgeW91IGNh
biB0ZWxsIG1lIGlmIGl0IHNvdW5kcyByaWdodCB0bwp5b3UuCgpJZiB3ZSdyZSBkb2luZyB0aGUg
YmFja3RyYWNlIGluIHBzZXVkby1OTUkgY29udGV4dCB0aGVuIHdlIGRlZmluaXRlbHkKZG9uJ3Qg
bmVlZCBpdC4gU3BlY2lmaWNhbGx5LCB0aGUgcHJpbnRrX2RlZmVycmVkX3tlbnRlcixleGl0fSgp
IGp1c3QKbWFuYWdlcyB0aGUgcGVyLWNwdSAicHJpbnRrX2NvbnRleHQiIHZhbHVlLiBUaGF0IHZh
bHVlIGRvZXNuJ3QgbWF0dGVyCmlmICJpbl9ubWkoKSIgcmV0dXJucyB0cnVlLgoKSWYgd2UncmUg
X25vdF8gZG9pbmcgdGhlIGJhY2t0cmFjZSBpbiBwc2V1ZG8tTk1JIGNvbnRleHQgdGhlbiBJIHRo
aW5rCndlIGFsc28gZG9uJ3QgbmVlZCBpdC4gQWZ0ZXIgYWxsLCBpZiB3ZSdyZSBub3QgaW4gcHNl
dWRvLU5NSSBjb250ZXh0CnRoZW4gaXQncyBwZXJmZWN0bHkgZmluZSB0byBwcmludCwgcmlnaHQ/
CgpXaGlsZSBpdCdzIGhhcmQgdG8ga25vdyAxMDAlIGZvciBzdXJlLCBteSBiZXN0IGd1ZXNzIGlz
IHRoYXQgaW4gYXJtCnRoaXMgbWlnaHQgaGF2ZSBoZWxwZWQgcHJldmVudCBzdGFjayB0cmFjZXMg
ZnJvbSBnZXR0aW5nIGludGVyc3BlcnNlZAphbW9uZyBvbmUgYW5vdGhlci4gSSBndWVzcyB0aGlz
IGlzIG5vIGxvbmdlciBuZWVkZWQgYXMgb2YgY29tbWl0CjU1ZDZhZjFkNjY4OCAoImxpYi9ubWlf
YmFja3RyYWNlOiBleHBsaWNpdGx5IHNlcmlhbGl6ZSBiYW5uZXIgYW5kCnJlZ3MiKT8gSW4gYW55
IGNhc2UsIHdoZW4gSSB0ZXN0ZWQgdGhpcyBlYXJsaWVyIHRoaW5ncyBzZWVtZWQgdG8KcHJpbnRv
dXQgZmluZSB3aXRob3V0IGl0Li4uCgpUaGF0IGJlaW5nIHNhaWQsIGl0IHdvdWxkbid0IGh1cnQg
dG8gaW5jbHVkZSBpdCBoZXJlIGFuZCBJJ2xsIGRvIGl0IGlmIHlvdSB3YW50LgoKLURvdWcKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpLZ2RiLWJ1Z3Jl
cG9ydCBtYWlsaW5nIGxpc3QKS2dkYi1idWdyZXBvcnRAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0
dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2tnZGItYnVncmVwb3J0
Cg==
