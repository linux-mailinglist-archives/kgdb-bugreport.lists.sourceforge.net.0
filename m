Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C05EA6ED3F4
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 24 Apr 2023 19:53:47 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1pr0Nn-0004oF-2d
	for lists+kgdb-bugreport@lfdr.de;
	Mon, 24 Apr 2023 17:53:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1pr0Nl-0004o9-JA
 for kgdb-bugreport@lists.sourceforge.net;
 Mon, 24 Apr 2023 17:53:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7A/OOVQszAo19NkFFicWYt7Qdu7ANiP0rHvHX9DAp1s=; b=HHrvMx0osSExE/eue6VMzoT+ST
 S4RCHFlAV4Nq42gF13gLL1qQtT2O/p9vn3wZpQVu6Bu6wa/L1lZtnC5Opm89KXC2OwLl/WaSYsrUC
 moC3I+Yfh6Q+2iapGebvfDUuZqACuSSXun3OAJntDJ/c8kofJxRSiIBDK4XRbo5sNxOk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7A/OOVQszAo19NkFFicWYt7Qdu7ANiP0rHvHX9DAp1s=; b=QX8VO6iev1zVlTTOY+m6eC/7Sw
 t0oNAWwv54BNd+ypw2BDq53AG3iA67EDl+9otwpLqfG6kc4VehLhdiegwRF2/QyMKV10agwqIf+hd
 +Q63O52AlUyVxG1krVGiRHBmSiL+beXKuQBy+exctiyQskf6Pya3i3Xhd605XQIqpfyc=;
Received: from mail-io1-f50.google.com ([209.85.166.50])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1pr0Ni-0005xS-SB for kgdb-bugreport@lists.sourceforge.net;
 Mon, 24 Apr 2023 17:53:44 +0000
Received: by mail-io1-f50.google.com with SMTP id
 ca18e2360f4ac-763c9805ff5so26917239f.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 24 Apr 2023 10:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1682358815; x=1684950815;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7A/OOVQszAo19NkFFicWYt7Qdu7ANiP0rHvHX9DAp1s=;
 b=mhTy24Lj0p/fEPaLkqNm71XUXAnd9zDcdKxoSI5btCZ0cLkPtEKdA3B9rIK6kB3b0R
 U0GpmdZ3p44wb8xlyELiPhj9JDDP5qsBznUtR4VMf/w5+atbx7bzGMQYX2NxvxAwkSFK
 /ohzQ8oAvZ/tOjO+Dp54ww4r1K7Y0FmmI9GTY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682358815; x=1684950815;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7A/OOVQszAo19NkFFicWYt7Qdu7ANiP0rHvHX9DAp1s=;
 b=BsMLgf9zb2AbOoUbivZvLyoiDlaDP5zfezAxB7RAtpP/teHWmYUskb3eZq8apF3PBQ
 HvntNkNuE7I+hQT3U3ueLYz7V8Op2toC/u7TLr1SdrLCDyVgOIn/0c265Uw2Ywv/rh3k
 dPkXsqwDK2Jw3e/NIzPr5XO2Gjg2oJX192gGK8e84yMZE7UkX9aPJuG+XXkygJ3ElGq8
 m4nYwsXOFL5oBiiA/TNBFiyUDxTe/HcqEzGvOxO84H8E1Fg1LsQJve6tm+6tiTtX9tWn
 B9xCncUjgltYkx4xsZrX2plBn/DGWlCl/uPdArE0ge+YBUVI5SqnANE6p8o0oSuY+8NC
 0Frw==
X-Gm-Message-State: AAQBX9cs9BhiYajINB5/xY1UUBKc+x1Uix0EAYMzTYSYPDBtZzmtKkPJ
 cud+WaswAglEIsowLETX30fvmrp/GIJwT4CMZN8=
X-Google-Smtp-Source: AKy350aMiKQJtGMslly7d4b1Jk/cKUQT5a3bYNkUwm3cdPfndoM1Zgot2cf18Dt53n/pIEZRMQM7fw==
X-Received: by 2002:a5e:d710:0:b0:763:b48e:1429 with SMTP id
 v16-20020a5ed710000000b00763b48e1429mr5926825iom.20.1682358815669; 
 Mon, 24 Apr 2023 10:53:35 -0700 (PDT)
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com.
 [209.85.166.169]) by smtp.gmail.com with ESMTPSA id
 bt6-20020a056638430600b0040f98da8c45sm3375911jab.72.2023.04.24.10.53.32
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Apr 2023 10:53:33 -0700 (PDT)
Received: by mail-il1-f169.google.com with SMTP id
 e9e14a558f8ab-329577952c5so1088505ab.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 24 Apr 2023 10:53:32 -0700 (PDT)
X-Received: by 2002:a05:6e02:1bcd:b0:315:8e3a:f546 with SMTP id
 x13-20020a056e021bcd00b003158e3af546mr23458ilv.6.1682358812275; Mon, 24 Apr
 2023 10:53:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230419225604.21204-1-dianders@chromium.org>
 <20230419155341.v8.3.I6d7f7d5fa0aa293c8c3374194947254b93114d37@changeid>
In-Reply-To: <20230419155341.v8.3.I6d7f7d5fa0aa293c8c3374194947254b93114d37@changeid>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 24 Apr 2023 10:53:20 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WWkott-nuPtV56PGGJdaYqSK5zf_DLGjG_AzGb9vHAoA@mail.gmail.com>
Message-ID: <CAD=FV=WWkott-nuPtV56PGGJdaYqSK5zf_DLGjG_AzGb9vHAoA@mail.gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Sumit Garg <sumit.garg@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>, 
 Marc Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hi, On Wed, Apr 19, 2023 at 3:57 PM Douglas Anderson <dianders@chromium.org>
    wrote: > > From: Sumit Garg <sumit.garg@linaro.org> > > Assign an unused
   IPI which can be turned as NMI using ipi_nmi framewo [...] 
 
 Content analysis details:   (-0.4 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.166.50 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.166.50 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pr0Ni-0005xS-SB
Subject: Re: [Kgdb-bugreport] [PATCH v8 03/10] arm64: smp: Assign and setup
 an IPI as NMI
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
Cc: Masayoshi Mizuma <m.mizuma@jp.fujitsu.com>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Lecopzer Chen <lecopzer.chen@mediatek.com>,
 Peter Zijlstra <peterz@infradead.org>, kgdb-bugreport@lists.sourceforge.net,
 ito-yuichi@fujitsu.com, linux-kernel@vger.kernel.org,
 Stephen Boyd <swboyd@chromium.org>, linux-perf-users@vger.kernel.org,
 Chen-Yu Tsai <wens@csie.org>, Pierre Gondois <Pierre.Gondois@arm.com>,
 Ben Dooks <ben-linux@fluff.org>, Thomas Gleixner <tglx@linutronix.de>,
 Masayoshi Mizuma <msys.mizuma@gmail.com>, Ard Biesheuvel <ardb@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

SGksCgpPbiBXZWQsIEFwciAxOSwgMjAyMyBhdCAzOjU34oCvUE0gRG91Z2xhcyBBbmRlcnNvbiA8
ZGlhbmRlcnNAY2hyb21pdW0ub3JnPiB3cm90ZToKPgo+IEZyb206IFN1bWl0IEdhcmcgPHN1bWl0
LmdhcmdAbGluYXJvLm9yZz4KPgo+IEFzc2lnbiBhbiB1bnVzZWQgSVBJIHdoaWNoIGNhbiBiZSB0
dXJuZWQgYXMgTk1JIHVzaW5nIGlwaV9ubWkgZnJhbWV3b3JrLgo+IEFsc28sIGludm9rZSBjb3Jy
ZXNwb25kaW5nIGR5bmFtaWMgSVBJIHNldHVwL3RlYXJkb3duIEFQSXMuCj4KPiBTaWduZWQtb2Zm
LWJ5OiBTdW1pdCBHYXJnIDxzdW1pdC5nYXJnQGxpbmFyby5vcmc+Cj4gUmV2aWV3ZWQtYnk6IE1h
c2F5b3NoaSBNaXp1bWEgPG0ubWl6dW1hQGpwLmZ1aml0c3UuY29tPgo+IFRlc3RlZC1ieTogQ2hl
bi1ZdSBUc2FpIDx3ZW5zQGNzaWUub3JnPgo+IFNpZ25lZC1vZmYtYnk6IERvdWdsYXMgQW5kZXJz
b24gPGRpYW5kZXJzQGNocm9taXVtLm9yZz4KPiAtLS0KPgo+IENoYW5nZXMgaW4gdjg6Cj4gLSBk
eW5hbWljX2lwaV9zZXR1cCgpIGFuZCBkeW5hbWljX2lwaV90ZWFyZG93bigpIG5vIGxvbmdlciB0
YWtlIGNwdSBwYXJhbQo+Cj4gIGFyY2gvYXJtNjQva2VybmVsL3NtcC5jIHwgOCArKysrKysrKwo+
ICAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9h
cm02NC9rZXJuZWwvc21wLmMgYi9hcmNoL2FybTY0L2tlcm5lbC9zbXAuYwo+IGluZGV4IDRlODMy
NzI2NDI1NS4uOTRmZjA2MzUyN2M2IDEwMDY0NAo+IC0tLSBhL2FyY2gvYXJtNjQva2VybmVsL3Nt
cC5jCj4gKysrIGIvYXJjaC9hcm02NC9rZXJuZWwvc21wLmMKPiBAQCAtNDMsNiArNDMsNyBAQAo+
ICAjaW5jbHVkZSA8YXNtL2RhaWZmbGFncy5oPgo+ICAjaW5jbHVkZSA8YXNtL2t2bV9tbXUuaD4K
PiAgI2luY2x1ZGUgPGFzbS9tbXVfY29udGV4dC5oPgo+ICsjaW5jbHVkZSA8YXNtL25taS5oPgo+
ICAjaW5jbHVkZSA8YXNtL251bWEuaD4KPiAgI2luY2x1ZGUgPGFzbS9wcm9jZXNzb3IuaD4KPiAg
I2luY2x1ZGUgPGFzbS9zbXBfcGxhdC5oPgo+IEBAIC05MzgsNiArOTM5LDggQEAgc3RhdGljIHZv
aWQgaXBpX3NldHVwKGludCBjcHUpCj4KPiAgICAgICAgIGZvciAoaSA9IDA7IGkgPCBucl9pcGk7
IGkrKykKPiAgICAgICAgICAgICAgICAgZW5hYmxlX3BlcmNwdV9pcnEoaXBpX2lycV9iYXNlICsg
aSwgMCk7Cj4gKwo+ICsgICAgICAgZHluYW1pY19pcGlfc2V0dXAoKTsKPiAgfQo+Cj4gICNpZmRl
ZiBDT05GSUdfSE9UUExVR19DUFUKPiBAQCAtOTUwLDYgKzk1Myw4IEBAIHN0YXRpYyB2b2lkIGlw
aV90ZWFyZG93bihpbnQgY3B1KQo+Cj4gICAgICAgICBmb3IgKGkgPSAwOyBpIDwgbnJfaXBpOyBp
KyspCj4gICAgICAgICAgICAgICAgIGRpc2FibGVfcGVyY3B1X2lycShpcGlfaXJxX2Jhc2UgKyBp
KTsKPiArCj4gKyAgICAgICBkeW5hbWljX2lwaV90ZWFyZG93bigpOwo+ICB9Cj4gICNlbmRpZgo+
Cj4gQEAgLTk3MSw2ICs5NzYsOSBAQCB2b2lkIF9faW5pdCBzZXRfc21wX2lwaV9yYW5nZShpbnQg
aXBpX2Jhc2UsIGludCBuKQo+ICAgICAgICAgICAgICAgICBpcnFfc2V0X3N0YXR1c19mbGFncyhp
cGlfYmFzZSArIGksIElSUV9ISURERU4pOwo+ICAgICAgICAgfQo+Cj4gKyAgICAgICBpZiAobiA+
IG5yX2lwaSkKPiArICAgICAgICAgICAgICAgc2V0X3NtcF9keW5hbWljX2lwaShpcGlfYmFzZSAr
IG5yX2lwaSk7CgpGcm9tIHRoaW5raW5nIGFib3V0IHRoaXMgcGF0Y2ggbW9yZSwgSSdtIGd1ZXNz
aW5nIHRoYXQgdGhlIGJpZ2dlc3QKb2JqZWN0aW9uIHNvbWVvbmUgY291bGQgaGF2ZSBpcyB0aGF0
IHRoaXMgdXNlcyB1cCB0aGUgImxhc3QiIElQSSBzbG90CmluIGFueSBzeXN0ZW1zIHRoYXQgYXJl
IHN0dWNrIHdpdGggb25seSA4LiBJcyB0aGF0IHRoZSByZWFzb24gdGhhdAp0aGlzIHBhdGNoIHNl
cmllcyBzdGFnbmF0ZWQgaW4gdGhlIHBhc3QsIG9yIHdhcyBpdCBzb21ldGhpbmcgZWxzZT8KCklm
IHRoaXMgaXMgdHJ1bHkgdGhlIGNvbmNlcm4gdGhhdCBwZW9wbGUgaGF2ZSwgaXQgZG9lc24ndCBs
b29rIGxpa2UgaXQKd291bGQgYmUgdGVycmlibHkgaGFyZCB0byBjb21iaW5lIHRoZSBleGlzdGlu
ZyBJUElfQ1BVX1NUT1AgYW5kCklQSV9DUFVfQ1JBU0hfU1RPUC4gUHJlc3VtYWJseSB3ZSBjb3Vs
ZCBqdXN0IGdldCByaWQgb2YgdGhlICJjcmFzaApzdG9wIiBJUEkgYW5kIGhhdmUgdGhlIG5vcm1h
bCAic3RvcCIgSVBJIGRvIHRoZSBjcmFzaCBpZgoid2FpdGluZ19mb3JfY3Jhc2hfaXBpIiBpcyBu
b24temVyby4gSWYgdGhhdCdzIHRoZSB0aGluZyBibG9ja2luZyB0aGUKc2VyaWVzIGZyb20gbW92
aW5nIGZvcndhcmQgdGhlbiBJIGNhbiBhZGQgdGhhdCB0byB0aGUgc2VyaWVzLCBvciB3ZQpjb3Vs
ZCBqdXN0IHdhaXQgdW50aWwgc29tZW9uZSBhY3R1YWxseSBuZWVkcyBhbm90aGVyIElQSS4gOy0p
CgotRG91ZwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CktnZGItYnVncmVwb3J0IG1haWxpbmcgbGlzdApLZ2RiLWJ1Z3JlcG9ydEBsaXN0cy5zb3VyY2Vm
b3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8va2dk
Yi1idWdyZXBvcnQK
