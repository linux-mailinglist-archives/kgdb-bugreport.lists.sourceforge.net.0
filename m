Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 74BDC8A521B
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 15 Apr 2024 15:46:10 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1rwMeu-0001Zb-VZ
	for lists+kgdb-bugreport@lfdr.de;
	Mon, 15 Apr 2024 13:46:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daniel.thompson@linaro.org>) id 1rwMet-0001ZT-JQ
 for kgdb-bugreport@lists.sourceforge.net;
 Mon, 15 Apr 2024 13:46:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tFic6asmsSS4GxpnpFHB7llM++UFIY5gXajahwq1PxY=; b=jbsr8R3TU/gvc4jp4pEYKwfJ3n
 dn1eD/H/L+Ohs+pjgc36pK2tqVTcztObc9DWZW3kkzk/gXumyRQ3NuDRFWeIZnCHEumPOWMUAYvNB
 uHX7GkaoCvii9dvc2q1Ndu9vqSKTtL3Q8A5ivKRNmMvwfxaRr1p8XvhFXTl3otGnPIy0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tFic6asmsSS4GxpnpFHB7llM++UFIY5gXajahwq1PxY=; b=Lv6bnSWcWV1IwIkxlKHLbeFQbJ
 dyCEjdLEM5qA2gxw4VEwq3KgWCv9cnHxbtf5+othqYsV0vnPjneoT5VDzw3btCylKWIA0PTiJevfQ
 Ts3ZPgOgjVSMomx7axsNybzDODu4lV/GRuN79oFkGtzRQHroBJwdLLjTPsqC0avhVSiA=;
Received: from mail-wm1-f51.google.com ([209.85.128.51])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rwMes-0006gw-Ej for kgdb-bugreport@lists.sourceforge.net;
 Mon, 15 Apr 2024 13:46:07 +0000
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-41882c16824so831885e9.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 15 Apr 2024 06:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713188759; x=1713793559; darn=lists.sourceforge.net;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=tFic6asmsSS4GxpnpFHB7llM++UFIY5gXajahwq1PxY=;
 b=mrkXaMLBr0n3QBnOH+QRe/5TlkDCXe4h/Bf44dFY787evzGfl0TX4EIZIaaqHPG8k6
 GVj32khUdcK8VUpAeKbnn5fc8yEmRvDHpTr6FeoZivNREpFe2nANkxFW83ELtkTLSqBM
 Fc9tttZgDlLnKLwGpuevvpSL9i+HOIDncFZ7+z0ZUd8O8J6qu7FkEet+ixaEPUtbDr/z
 Zd7LWUBtAqqaLLkANoGNzosS/LjHNoSWu+tKaYqKA/K+vbU089wMFY5GHtKVTewFKZAR
 NxaVFtI/h0hk88Rv9vLi7HnApORWH3fYWX828hFFjPnde6tP5BGh17x0ihIecCoflPmh
 LiMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713188759; x=1713793559;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tFic6asmsSS4GxpnpFHB7llM++UFIY5gXajahwq1PxY=;
 b=eQZjggRkEKLTjp6bRj+QLI5WEQXlqTxazuD27xT6wpbxB0RbawfxDxHcleOY1MadL8
 4NLDzMSwzn22pTrbF/hOkauFww+KJ2RD73ZbfDFp4/b2c4BxJUT0UlvOEqkJyfC1tvhM
 aBGx5PaDhI0Uu9Tc7vV2T/6xshCT8Q83pL38gv2S4K0mGuCPOq/9HEjIBO8otcP6BF9H
 U4+gg4stO5HB6rUtiO2CpknqrA6kRxMNLXZCuGDwdtWT4LA9npBu08ZBI3qfywvN/BJ4
 Nh0diSaqQneavOUftsReNdJaxb+P6vxBBBR9ssX4sxQ3YcKjcuiBRgIBOGy8CKpV7ba8
 IRDg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXYc8YcJYuMAB9Hwmn50+EM5VsHAoL9wij22H4RJ1FYrEO+m4EKf0NgbLP0jjIrK04iGDWwEOBJKZCR3GvJJxZjjtSvQC6tGEU7Nv8Kp7jalx6S2YA=
X-Gm-Message-State: AOJu0YyH1/Xl0/MJqM/Xh+AMAJ8U2hpvXJ472DS6ujjkjImKGPyE0iqq
 dGJWS/M4yZp0jaliU81oRc8f11R09B10MHaERwiPDgMG4ma+L8/YThtkSJ3rOEo=
X-Google-Smtp-Source: AGHT+IGtEZhJYcvyjUaVR5q7Z3EL35x0pB8Vqt2ojfVp/KteirYWhqyPS4ibiVPICSxTCCqCIBmRvg==
X-Received: by 2002:adf:e286:0:b0:347:9bec:9ba3 with SMTP id
 v6-20020adfe286000000b003479bec9ba3mr2565872wri.66.1713188758769; 
 Mon, 15 Apr 2024 06:45:58 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 o18-20020a5d6852000000b00343e8968917sm12249163wrw.1.2024.04.15.06.45.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Apr 2024 06:45:58 -0700 (PDT)
Date: Mon, 15 Apr 2024 14:45:56 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Justin Stitt <justinstitt@google.com>
Message-ID: <20240415134556.GA492724@aspen.lan>
References: <20240405-strncpy-kernel-debug-kdb-kdb_io-c-v2-1-d0bf595ab301@google.com>
 <20240405095144.GB2890893@aspen.lan>
 <CAFhGd8q99emm1SFJSs=L7Pn0A79vCtDHtTD5XUbVCNh=DDadaQ@mail.gmail.com>
 <20240409183558.GA7510@aspen.lan>
 <CAFhGd8qESuuifuHsNjFPR-Va3P80bxrw+LqvC8deA8GziUJLpw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFhGd8qESuuifuHsNjFPR-Va3P80bxrw+LqvC8deA8GziUJLpw@mail.gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Tue, Apr 09, 2024 at 01:48:38PM -0700, Justin Stitt wrote:
    > Hi, > > On Tue, Apr 9, 2024 at 11:36 AM Daniel Thompson > <daniel.thompson@linaro.org>
    wrote: > > > > On Mon, Apr 08, 2024 at 05:46:42 [...] 
 
 Content analysis details:   (-0.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
                             blocked.  See
                             http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
                              for more information.
                             [URIs: linaro.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.128.51 listed in wl.mailspike.net]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
X-Headers-End: 1rwMes-0006gw-Ej
Subject: Re: [Kgdb-bugreport] [PATCH v2] kdb: replace deprecated strncpy
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
Cc: kgdb-bugreport@lists.sourceforge.net, linux-hardening@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jason Wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

T24gVHVlLCBBcHIgMDksIDIwMjQgYXQgMDE6NDg6MzhQTSAtMDcwMCwgSnVzdGluIFN0aXR0IHdy
b3RlOgo+IEhpLAo+Cj4gT24gVHVlLCBBcHIgOSwgMjAyNCBhdCAxMTozNuKAr0FNIERhbmllbCBU
aG9tcHNvbgo+IDxkYW5pZWwudGhvbXBzb25AbGluYXJvLm9yZz4gd3JvdGU6Cj4gPgo+ID4gT24g
TW9uLCBBcHIgMDgsIDIwMjQgYXQgMDU6NDY6NDJQTSAtMDcwMCwgSnVzdGluIFN0aXR0IHdyb3Rl
Ogo+ID4gPiBPbiBGcmksIEFwciA1LCAyMDI0IGF0IDI6NTHigK9BTSBEYW5pZWwgVGhvbXBzb24K
PiA+ID4gPGRhbmllbC50aG9tcHNvbkBsaW5hcm8ub3JnPiB3cm90ZToKPiA+ID4gPgo+ID4gPiA+
ID4gICAgICAgICAgICAgICAgICAgICAgIGxlbl90bXAgPSBzdHJsZW4ocF90bXApOwo+ID4gPiA+
ID4gLSAgICAgICAgICAgICAgICAgICAgIHN0cm5jcHkoY3AsIHBfdG1wK2xlbiwgbGVuX3RtcC1s
ZW4gKyAxKTsKPiA+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICBzdHJzY3B5KGNwLCBwX3Rt
cCtsZW4sIGxlbl90bXAtbGVuICsgMSk7Cj4gPiA+ID4KPiA+ID4gPiBBZ2FpbiwgSSByZWFsbHkg
ZG9uJ3QgdGhpbmsgdGhlIHRoaXJkIGFyZ3VtZW50IHByb3ZpZGVzIHRoZSBudW1iZXIgb2YKPiA+
ID4gPiBjaGFyYWN0ZXJzIGluIHRoZSBkZXN0aW5hdGlvbiBidWZmZXIuCj4gPiA+ID4KPiA+ID4K
PiA+ID4gUmlnaHQsIHRoZSB0aGlyZCBhcmd1bWVudCBpcyB0aGUgbGVuZ3RoIG9mIHRoZSAicmVt
YWluaW5nIiBjaGFyYWN0ZXJzCj4gPiA+IGZyb20gdGhlIGNvbXBsZXRpb24gcG9pbnQuCj4gPgo+
ID4gV2hpY2ggaXMgbm90IGhvdyBzdHJzY3B5KCkgaXMgZGVzaWduZWQgdG8gYmUgdXNlZC4KPiA+
Cj4gPgo+ID4gPiBpZiB5b3UgdHlwZSAidGVzIiBhbmQgcHJlc3MgdGFiIHRoZW4ga2FsbHN5bXNf
c3ltYm9sX2NvbXBsZXRlKCkgd2lsbAo+ID4gPiBwb3B1bGF0ZSBwX3RtcCB3aXRoICJ0ZXN0Ii4g
UHJpb3IgdG8gcmVuZGVyaW5nIHRvIHRoZSB1c2VyLCBAY3AgcG9pbnRzCj4gPiA+IHRvICJzIiwg
d2UgbmVlZCB0byBjYXRjaCB0aGUgdXNlciB1cCBhbmQgcHJpbnQgdGhlIHJlc3Qgb2YgdGhlIHN5
bWJvbAo+ID4gPiBuYW1lIHNpbmNlIHRoZXkndmUgYWxyZWFkeSB0eXBlZCAidGVzIiB3ZSBvbmx5
IG5lZWQgdG8gcHJpbnQgb3V0ICJ0Ii4KPiA+Cj4gPiBJJ20gbW9yZSBjb25jZXJuZWQgYWJvdXQg
dGhlIGNhc2Ugd2hlcmUgeW91IGZpbGwgdGhlIGJ1ZmZlciBlbnRpcmVseQo+ID4gdGhlbiBtb3Zl
IHRoZSBjdXJzb3IgbGVmdCB1bnRpbCB5b3UgZ2V0IHRvIHRoZSB0ZXMgYW5kIHRoZW4gcHJlc3Mg
VGFiLgo+ID4gSSB0aGluayBhdCB0aGUgcG9pbnQgd2Ugd3JpdGUgdG9vIG1hbnkgYnl0ZXMgdG8g
Y3AuCj4gPgo+ID4KPiA+ID4gbGVuX3RtcCBpcyB0aGUgbGVuZ3RoIG9mIHRoZSBlbnRpcmUgc3lt
Ym9sIHBhcnQgYXMgcmV0dXJuZWQgYnkKPiA+ID4ga2FsbHN5bXNfc3ltYm9sX2NvbXBsZXRlKCkg
YW5kIGxlbiBpcyB0aGUgbGVuZ3RoIG9mIG9ubHkgdGhlCj4gPiA+IHVzZXItdHlwZWQgc3ltYm9s
LiBUaGVyZWZvcmUsIHRoZSBhbW91bnQgb2YgcmVtYWluaW5nIGNoYXJhY3RlcnMgdG8KPiA+ID4g
cHJpbnQgaXMgZ2l2ZW4gYnkgbGVuX3RtcC1sZW4gKGFuZCArMSBmb3IgYSBOVUwtYnl0ZSkuCj4g
PiA+Cj4gPiA+IFNvLCB5ZWFoLCB5b3UncmUgcmlnaHQuIFRoaXMgaXNuJ3QgdGhlIGxlbmd0aCBv
ZiB0aGUgZGVzdGluYXRpb24gYnV0IEkKPiA+ID4gZG9uJ3Qgc2VlIHdoeSB3ZSBjYW4ndCB1c2Ug
bWVtY3B5KCkgKG9yIHN0cnNjcHkoKSkgYW5kIGhhdmUgdGhpcyBub3QKPiA+ID4gYmUgY29uc2lk
ZXJlZCAiYnJva2VuIi4gVGhlIHBvaW50ZXIgYXJpdGhtZXRpYyBjaGVja3Mgb3V0Lgo+ID4KPiA+
IFRoZSBwcm9ibGVtIHdpdGggc3Vic3RpdHV0aW5nIHN0cm5jcHkoKSB3aXRoIG1lbWNweSgpIGlz
IHRoYXQgaXMgKm5vdCoKPiA+IG9idmlvdXNseSB3cm9uZy4uLiBidXQgaXQgY291bGQgYmUgc3Vi
dGx5IHdyb25nLgo+ID4KPiA+IFdlIGNhbiBzZWUgdGhhdCB0aGUgcGVyc29uIHdobyBvcmlnaW5h
bGx5IHdyb3RlIHRoaXMgY29kZSBtYWRlIGEgcHJldHR5Cj4gPiBzZXJpb3VzIG1pc3Rha2Ugd2l0
aCBzdHJuY3B5KCkgYW5kIHRoZSB0aGlyZCBhcmd1bWVudCBpZiBnYXJiYWdlLiBJdCBpcwo+ID4g
dGhlcmVmb3JlIGltcG9ydGFudCB0byBmaWd1cmUgb3V0IHdoYXQgdGhlICpjb3JyZWN0KiB2YWx1
ZSBmb3IgYXJndW1lbnQKPiA+ICMzIHNob3VsZCBoYXZlIGJlZW4gKmJlZm9yZSogd2UgYXR0ZW1w
dCB0byByZXBsYWNlIHN0cm5jcHkoKSB3aXRoCj4gPiBhbnl0aGluZy4KPiA+Cj4gPiBUcmFuc2Zv
cm1pbmcgc29tZXRoaW5nIHdlIGtub3cgdG8gYmUgYnJva2VuIHdpdGhvdXQgZml4aW5nIGl0IGZp
cnN0Cj4gPiBtZWFucyBpdCBpcyBpbXBvc3NpYmxlIHRvIGtub3cgaWYgdGhlIHRyYW5zZm9ybWF0
aW9uIGlzIGNvcnJlY3Qgb3Igbm90Lgo+ID4gSGVuY2UgdGhlIG9yaWdpbmFsIHF1ZXN0aW9uLCBo
b3cgZG8gd2Uga25vdyB0aGVyZSBpcyBlbm91Z2ggc3BhY2UKPiA+IGFmdGVyIGNwIHRvIHN0b3Jl
IHRoZSBzdHJpbmc/Cj4KPiBHb3RjaGEsIEkgd2lsbCBmaW5kIHRpbWUgdG8gc2VyaW91c2x5IHJl
ZmFjdG9yL3Jld3JpdGUgdGhpcyBmdW5jdGlvbgo+IChvciBhdCB0aGUgdmVyeSBsZWFzdCB0aGUg
dGFiIGhhbmRsaW5nIHBhcnQgb2YgaXQpLgo+Cj4gQXQgdGhlIGVuZCBvZiB0aGUgZGF5LCB0aG91
Z2gsIEkganVzdCB3YW50IHRoaXMgc3RybmNweSgpIGdvbmUuCgpTby4uLiBJIHN0YXJ0aW5nIGxv
b2tpbmcgaW50byB3aGF0IGl0IHRha2VzIHRvIHByb3Zva2Uga2RiX3JlYWQoKSBpbnRvCm92ZXJm
bG93aW5nIGl0J3MgYnVmZmVycy4gU28gZmFyIEkgaGF2ZSBmb3VuZCB0d28gd2F5cyAob25lIG9m
IHdoaWNoCmRvZXMgYWZmZWN0IHRoaXMgc3RybmNweSgpIGNvZGUgYXMgSSB0aG91Z2h0KS4KCkkg
dG9vayB0aGUgdmlldyB0aGF0IHRoZSBzdHJuY3B5KCkgKG9yIGFueSBvdGhlciBjb3B5KSBpbnRv
CnRtcGJ1ZmZlci9wX3RtcCBpcyBqdXN0IHRoZSB3cm9uZyB0aGluZyB0byBkby4gQSBtZW1tb3Zl
KCkgaXMgc2ltcGx5CmEgYmV0dGVyIGFwcHJvYWNoIQoKU2hvcnQgdmVyaXNvbiwgd2hpbHN0IHRo
ZXJlIGlzIG90aGVyIHJlZmFjdG9yaW5nIG5lZWRlZCwgdGhpcyBjaGFuZ2UKZml4ZXMgdGhlIG92
ZXJmbG93LiBJIGhvcGUgaXQgYWxzbyBtZWV0cyB5b3VyIGFtYml0aW9uIHdpdGggcmVzcGVjdAp0
byBzdHJuY3B5KCkuCgoKRGFuaWVsLgoKCgpGcm9tIGFhYjgzZmM5ZDBlOTc5ODdmZGVjNTE2MTNi
NTM2ZmMzMmE2M2M1NDQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCkZyb206IERhbmllbCBUaG9t
cHNvbiA8ZGFuaWVsLnRob21wc29uQGxpbmFyby5vcmc+CkRhdGU6IE1vbiwgMTUgQXByIDIwMjQg
MTQ6MzU6MDYgKzAxMDAKU3ViamVjdDogW1BBVENIXSBrZGI6IEZpeCBidWZmZXIgb3ZlcmZsb3cg
ZHVyaW5nIHRhYi1jb21wbGV0ZQoKQ3VycmVudGx5LCB3aGVuIHRoZSB1c2VyIGF0dGVtcHRzIHN5
bWJvbCBjb21wbGV0aW9uIHdpdGggdGhlIFRhYiBrZXksIGtkYgp3aWxsIHVzZSBzdHJuY3B5KCkg
dG8gaW5zZXJ0IHRoZSBjb21wbGV0ZWQgc3ltYm9sIGludG8gdGhlIGNvbW1hbmQgYnVmZmVyLgpV
bmZvcnR1bmF0ZWx5IGl0IHBhc3NlcyB0aGUgc2l6ZSBvZiB0aGUgc291cmNlIGJ1ZmZlciByYXRo
ZXIgdGhhbiB0aGUKZGVzdGluYXRpb24gdG8gc3RybmNweSgpIHdpdGggcHJlZGljdGFibHkgaG9y
cmlibGUgcmVzdWx0cy4gTW9zdCBvYnZpb3VzbHkKaWYgdGhlIGNvbW1hbmQgYnVmZmVyIGlzIGFs
cmVhZHkgZnVsbCBidXQgY3AsIHRoZSBjdXJzb3IgcG9zaXRpb24sIGlzIGluCnRoZSBtaWRkbGUg
b2YgdGhlIGJ1ZmZlciwgdGhlbiB3ZSB3aWxsIHdyaXRlIHBhc3QgdGhlIGVuZCBvZiB0aGUgc3Vw
cGxpZWQKYnVmZmVyLgoKRXZlbiB3aGVuIHRoZSBidWZmZXIgZG9lcyBub3Qgb3ZlcmZsb3cgdGhl
cmUgYXJlIG90aGVyIHByb2JsZW1zIHdoZW4gY3AgaXMKaW4gdGhlIG1pZGRsZSBvZiBhIGxpbmUu
IEZvciBleGFtcGxlIHRoZSBjdXJzb3IgcG9zaXRpb24gaXMgbm90IHVwZGF0ZWQKY29ycmVjdGx5
IG1lYW5pbmcgd2hhdCBpcyBzaG93biB0byB0aGUgdXNlciBvbiB0aGUgY29uc29sZSBpcyBub3Qg
d2hhdCBpcwphY3R1YWxseSBwcmVzZW50IGluIHRoZSBjb21tYW5kIGJ1ZmZlci4KCkZpeCB0aGlz
IGJ5IHJlcGxhY2luZyB0aGUgZHViaW91cyBzdHJuY3B5KCkgY2FsbHMgd2l0aCBtZW1tb3ZlKCkv
bWVtY3B5KCkKY2FsbHMgcGx1cyBleHBsaWNpdCBib3VuZGFyeSBjaGVja3MgdG8gbWFrZSBzdXJl
IHdlIGhhdmUgZW5vdWdoIHNwYWNlCmJlZm9yZSB3ZSBzdGFydCBtb3ZpbmcgY2hhcmFjdGVycyBh
cm91bmQuIFdlIGFsc28gYWRkIGEgc2Vjb25kIGNhbGwgdG8Ka2RiX3ByaW50ZigpIHRvIGZpeCB0
aGUgY29uc29sZSBjdXJzb3IgcG9zaXRpb24gaWYgbmVlZGVkLgoKUmVwb3J0ZWQtYnk6IEp1c3Rp
biBTdGl0dCA8anVzdGluc3RpdHRAZ29vZ2xlLmNvbT4KU2lnbmVkLW9mZi1ieTogRGFuaWVsIFRo
b21wc29uIDxkYW5pZWwudGhvbXBzb25AbGluYXJvLm9yZz4KLS0tCiBrZXJuZWwvZGVidWcva2Ri
L2tkYl9pby5jIHwgMjUgKysrKysrKysrKysrKysrKystLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQs
IDE3IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEva2VybmVsL2Rl
YnVnL2tkYi9rZGJfaW8uYyBiL2tlcm5lbC9kZWJ1Zy9rZGIva2RiX2lvLmMKaW5kZXggOTQ0M2Jj
NjNjNWEyNC4uM2ExYjlkZDg5MGY0NSAxMDA2NDQKLS0tIGEva2VybmVsL2RlYnVnL2tkYi9rZGJf
aW8uYworKysgYi9rZXJuZWwvZGVidWcva2RiL2tkYl9pby5jCkBAIC0zNjcsMTQgKzM2NywyMyBA
QCBzdGF0aWMgY2hhciAqa2RiX3JlYWQoY2hhciAqYnVmZmVyLCBzaXplX3QgYnVmc2l6ZSkKIAkJ
CWtkYl9wcmludGYoa2RiX3Byb21wdF9zdHIpOwogCQkJa2RiX3ByaW50ZigiJXMiLCBidWZmZXIp
OwogCQl9IGVsc2UgaWYgKHRhYiAhPSAyICYmIGNvdW50ID4gMCkgewotCQkJbGVuX3RtcCA9IHN0
cmxlbihwX3RtcCk7Ci0JCQlzdHJuY3B5KHBfdG1wK2xlbl90bXAsIGNwLCBsYXN0Y2hhci1jcCsx
KTsKLQkJCWxlbl90bXAgPSBzdHJsZW4ocF90bXApOwotCQkJc3RybmNweShjcCwgcF90bXArbGVu
LCBsZW5fdG1wLWxlbiArIDEpOwotCQkJbGVuID0gbGVuX3RtcCAtIGxlbjsKLQkJCWtkYl9wcmlu
dGYoIiVzIiwgY3ApOwotCQkJY3AgKz0gbGVuOwotCQkJbGFzdGNoYXIgKz0gbGVuOworCQkJLyog
SG93IG1hbnkgbmV3IGNoYXJhY3RlcnMgZG8gd2Ugd2FudCBmcm9tIHRtcGJ1ZmZlcj8gKi8KKwkJ
CWxlbl90bXAgPSBzdHJsZW4ocF90bXApIC0gbGVuOworCQkJaWYgKGxhc3RjaGFyICsgbGVuX3Rt
cCA+PSBidWZlbmQpCisJCQkJbGVuX3RtcCA9IGJ1ZmVuZCAtIGxhc3RjaGFyIC0gMTsKKworCQkJ
aWYgKGxlbl90bXApIHsKKwkJCQkvKiArIDEgZW5zdXJlcyB0aGUgJ1wwJyBpcyBtZW1tb3ZlJ2Qg
Ki8KKwkJCQltZW1tb3ZlKGNwK2xlbl90bXAsIGNwLCAobGFzdGNoYXItY3ApICsgMSk7CisJCQkJ
bWVtY3B5KGNwLCBwX3RtcCtsZW4sIGxlbl90bXApOworCQkJCWxhc3RjaGFyICs9IGxlbl90bXA7
CisKKwkJCQlrZGJfcHJpbnRmKCIlcyIsIGNwKTsKKwkJCQljcCArPSBsZW5fdG1wOworCQkJCWlm
IChjcCAhPSBsYXN0Y2hhcikKKwkJCQkJa2RiX3ByaW50ZigiXHIlcyUuKnMiLCBrZGJfcHJvbXB0
X3N0ciwKKwkJCQkJCSAgIChpbnQpKGNwIC0gYnVmZmVyKSwgYnVmZmVyKTsKKwkJCX0KIAkJfQog
CQlrZGJfbmV4dGxpbmUgPSAxOyAvKiByZXNldCBvdXRwdXQgbGluZSBudW1iZXIgKi8KIAkJYnJl
YWs7Ci0tCjIuNDMuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCktnZGItYnVncmVwb3J0IG1haWxpbmcgbGlzdApLZ2RiLWJ1Z3JlcG9ydEBsaXN0cy5z
b3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGlu
Zm8va2dkYi1idWdyZXBvcnQK
