Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 79A8A89E29F
	for <lists+kgdb-bugreport@lfdr.de>; Tue,  9 Apr 2024 20:36:14 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1ruGKL-0003dd-4z
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 09 Apr 2024 18:36:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daniel.thompson@linaro.org>) id 1ruGKJ-0003dW-U4
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 09 Apr 2024 18:36:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HGww5shByoRtigKjyGumtH/aUmzgn4PTucgk8lmHAG0=; b=UEKKkpEzL6ULMXIe/KxpHmYqur
 +7uDb2KPMe6PVmF/nvyO2PlW0SA+xrHBNwNLfPtd/5NCxx28+FEgYtVrp5zjtwfsxC1jnLenaF8mi
 FndP12sjPZFdFy2zu5o6cyM6BVufVFx397QNt2K8iwNoKrNUnvA48zAkRCq0SEAAbYbg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=HGww5shByoRtigKjyGumtH/aUmzgn4PTucgk8lmHAG0=; b=Du/FZPd7D6uGwC3/VywTB2+Eoy
 PG560RZGxLmYiQMRIWrRd/C0yvBbknUIU1GIOOYNlRtiMLaSo/OPuye8WQFGLvDvnCpGO81m5G1fK
 2hwTeTo93M6RE0irdbTlCgxvEQ+fsA8UFzpqUAKDysHD5fGLuEKPK03gRgCw1NDO6ONw=;
Received: from mail-ed1-f43.google.com ([209.85.208.43])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1ruGKG-0002XV-LM for kgdb-bugreport@lists.sourceforge.net;
 Tue, 09 Apr 2024 18:36:11 +0000
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-56e346224bdso4031464a12.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 09 Apr 2024 11:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712687762; x=1713292562; darn=lists.sourceforge.net;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=HGww5shByoRtigKjyGumtH/aUmzgn4PTucgk8lmHAG0=;
 b=y029Ik3pNJYJIiIG+iYbUjgj0DbSsIa7uL9MQbu+FqS4/eD+0U+MZ8uqmPcAtlh+i7
 wCjpS4uK2q0ZbXhNMlPdxmRhZ/aL3dr8rJ9AnZ9eSkkBRikp/mE+lMYZU7IKHOPczNgs
 TcLPildDHaqy55jOPsncFZc8ls5H9Tq85/sONs6vSkAPSzyl0PFwsx7a5coabgxDSLpU
 wPJvQXLNljTSWJlmEpR2sJGcV2Gfso0L/tNRhlXhn8stvGi7t3VpEwjqtbyzW866TsGz
 wXj1KFIe3/HA0c6JLcLhZcEVDKGCF2huJpFQ3SRK7vw2q8vUfReHdaA7eQvL1PIx1c3i
 yaPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712687762; x=1713292562;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HGww5shByoRtigKjyGumtH/aUmzgn4PTucgk8lmHAG0=;
 b=gCxcau/X6yuOgDAwEo+EKTMSHLk/DY2pY2aci9bcpe/4G84Gao9sWjavoA0lFloDTH
 q1v02QrZe7sGxX4Ub2qrY2YYqjCbpAIVKEEpbHk7bz25B0m62ZDspfXprQ0aoZH8FLjr
 21ZO5SBXvLN/Z9Xkx2FCNebOghP+Q5H++ys2rT/VOmhm0WWeIH2lkG3KamcuJwmpjfym
 v1sL9YfGgG3rkntI3Y/EvvivPvjVuZAR3Mmrz3FFq5pjgKPzSva5aVbo17hUKnCHvz+G
 /DAQfl3T6xdcggdwjppsSujSw2LTsmqKnLU4B+Tvh2Zl2wlOGTo9jFVgLXVJKI7AEKm6
 PpKg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXdsYeddvtX1Cm+shQUvM1p37VPp7meOxGpq9Qd4sBKCYsTfBSJ4Kt51FpQhkfE9zQE8imWJcReH4Qu+VX/CvaenUrMLdzoMVNOmts1LyA3Ni7zXX8=
X-Gm-Message-State: AOJu0YzZMhx796lLIAr3xaE0ljOpJ1rGIV8+fqAv6uEcVx2SfNZaPr0X
 P0vKIp4zh7/Qw/HXUlpczW2CFlv86EVKLxZWjAO1QIvcekCPDMVQfV62kO8s6Lc=
X-Google-Smtp-Source: AGHT+IFaht7HdhRywiHGuwHdU1xBpV5+E0e6kNNFSowSW+ic2P9pxCzAKkSehDZy1PtHmBeQAY/6EQ==
X-Received: by 2002:a50:cd95:0:b0:56d:c548:6af8 with SMTP id
 p21-20020a50cd95000000b0056dc5486af8mr243371edi.9.1712687762116; 
 Tue, 09 Apr 2024 11:36:02 -0700 (PDT)
Received: from aspen.lan ([95.90.216.199]) by smtp.gmail.com with ESMTPSA id
 eo9-20020a056402530900b0056c1380a972sm5450742edb.74.2024.04.09.11.36.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Apr 2024 11:36:01 -0700 (PDT)
Date: Tue, 9 Apr 2024 19:35:58 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Justin Stitt <justinstitt@google.com>
Message-ID: <20240409183558.GA7510@aspen.lan>
References: <20240405-strncpy-kernel-debug-kdb-kdb_io-c-v2-1-d0bf595ab301@google.com>
 <20240405095144.GB2890893@aspen.lan>
 <CAFhGd8q99emm1SFJSs=L7Pn0A79vCtDHtTD5XUbVCNh=DDadaQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFhGd8q99emm1SFJSs=L7Pn0A79vCtDHtTD5XUbVCNh=DDadaQ@mail.gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Mon, Apr 08, 2024 at 05:46:42PM -0700, Justin Stitt wrote:
    > On Fri, Apr 5, 2024 at 2:51 AM Daniel Thompson > <daniel.thompson@linaro.org>
    wrote: > > > > > len_tmp = strlen(p_tmp); > > > - strncp [...] 
 
 Content analysis details:   (-0.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.208.43 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.208.43 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
X-Headers-End: 1ruGKG-0002XV-LM
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

T24gTW9uLCBBcHIgMDgsIDIwMjQgYXQgMDU6NDY6NDJQTSAtMDcwMCwgSnVzdGluIFN0aXR0IHdy
b3RlOgo+IE9uIEZyaSwgQXByIDUsIDIwMjQgYXQgMjo1MeKAr0FNIERhbmllbCBUaG9tcHNvbgo+
IDxkYW5pZWwudGhvbXBzb25AbGluYXJvLm9yZz4gd3JvdGU6Cj4gPgo+ID4gPiAgICAgICAgICAg
ICAgICAgICAgICAgbGVuX3RtcCA9IHN0cmxlbihwX3RtcCk7Cj4gPiA+IC0gICAgICAgICAgICAg
ICAgICAgICBzdHJuY3B5KGNwLCBwX3RtcCtsZW4sIGxlbl90bXAtbGVuICsgMSk7Cj4gPiA+ICsg
ICAgICAgICAgICAgICAgICAgICBzdHJzY3B5KGNwLCBwX3RtcCtsZW4sIGxlbl90bXAtbGVuICsg
MSk7Cj4gPgo+ID4gQWdhaW4sIEkgcmVhbGx5IGRvbid0IHRoaW5rIHRoZSB0aGlyZCBhcmd1bWVu
dCBwcm92aWRlcyB0aGUgbnVtYmVyIG9mCj4gPiBjaGFyYWN0ZXJzIGluIHRoZSBkZXN0aW5hdGlv
biBidWZmZXIuCj4gPgo+Cj4gUmlnaHQsIHRoZSB0aGlyZCBhcmd1bWVudCBpcyB0aGUgbGVuZ3Ro
IG9mIHRoZSAicmVtYWluaW5nIiBjaGFyYWN0ZXJzCj4gZnJvbSB0aGUgY29tcGxldGlvbiBwb2lu
dC4KCldoaWNoIGlzIG5vdCBob3cgc3Ryc2NweSgpIGlzIGRlc2lnbmVkIHRvIGJlIHVzZWQuCgoK
PiBpZiB5b3UgdHlwZSAidGVzIiBhbmQgcHJlc3MgdGFiIHRoZW4ga2FsbHN5bXNfc3ltYm9sX2Nv
bXBsZXRlKCkgd2lsbAo+IHBvcHVsYXRlIHBfdG1wIHdpdGggInRlc3QiLiBQcmlvciB0byByZW5k
ZXJpbmcgdG8gdGhlIHVzZXIsIEBjcCBwb2ludHMKPiB0byAicyIsIHdlIG5lZWQgdG8gY2F0Y2gg
dGhlIHVzZXIgdXAgYW5kIHByaW50IHRoZSByZXN0IG9mIHRoZSBzeW1ib2wKPiBuYW1lIHNpbmNl
IHRoZXkndmUgYWxyZWFkeSB0eXBlZCAidGVzIiB3ZSBvbmx5IG5lZWQgdG8gcHJpbnQgb3V0ICJ0
Ii4KCkknbSBtb3JlIGNvbmNlcm5lZCBhYm91dCB0aGUgY2FzZSB3aGVyZSB5b3UgZmlsbCB0aGUg
YnVmZmVyIGVudGlyZWx5CnRoZW4gbW92ZSB0aGUgY3Vyc29yIGxlZnQgdW50aWwgeW91IGdldCB0
byB0aGUgdGVzIGFuZCB0aGVuIHByZXNzIFRhYi4KSSB0aGluayBhdCB0aGUgcG9pbnQgd2Ugd3Jp
dGUgdG9vIG1hbnkgYnl0ZXMgdG8gY3AuCgoKPiBsZW5fdG1wIGlzIHRoZSBsZW5ndGggb2YgdGhl
IGVudGlyZSBzeW1ib2wgcGFydCBhcyByZXR1cm5lZCBieQo+IGthbGxzeW1zX3N5bWJvbF9jb21w
bGV0ZSgpIGFuZCBsZW4gaXMgdGhlIGxlbmd0aCBvZiBvbmx5IHRoZQo+IHVzZXItdHlwZWQgc3lt
Ym9sLiBUaGVyZWZvcmUsIHRoZSBhbW91bnQgb2YgcmVtYWluaW5nIGNoYXJhY3RlcnMgdG8KPiBw
cmludCBpcyBnaXZlbiBieSBsZW5fdG1wLWxlbiAoYW5kICsxIGZvciBhIE5VTC1ieXRlKS4KPgo+
IFNvLCB5ZWFoLCB5b3UncmUgcmlnaHQuIFRoaXMgaXNuJ3QgdGhlIGxlbmd0aCBvZiB0aGUgZGVz
dGluYXRpb24gYnV0IEkKPiBkb24ndCBzZWUgd2h5IHdlIGNhbid0IHVzZSBtZW1jcHkoKSAob3Ig
c3Ryc2NweSgpKSBhbmQgaGF2ZSB0aGlzIG5vdAo+IGJlIGNvbnNpZGVyZWQgImJyb2tlbiIuIFRo
ZSBwb2ludGVyIGFyaXRobWV0aWMgY2hlY2tzIG91dC4KClRoZSBwcm9ibGVtIHdpdGggc3Vic3Rp
dHV0aW5nIHN0cm5jcHkoKSB3aXRoIG1lbWNweSgpIGlzIHRoYXQgaXMgKm5vdCoKb2J2aW91c2x5
IHdyb25nLi4uIGJ1dCBpdCBjb3VsZCBiZSBzdWJ0bHkgd3JvbmcuCgpXZSBjYW4gc2VlIHRoYXQg
dGhlIHBlcnNvbiB3aG8gb3JpZ2luYWxseSB3cm90ZSB0aGlzIGNvZGUgbWFkZSBhIHByZXR0eQpz
ZXJpb3VzIG1pc3Rha2Ugd2l0aCBzdHJuY3B5KCkgYW5kIHRoZSB0aGlyZCBhcmd1bWVudCBpZiBn
YXJiYWdlLiBJdCBpcwp0aGVyZWZvcmUgaW1wb3J0YW50IHRvIGZpZ3VyZSBvdXQgd2hhdCB0aGUg
KmNvcnJlY3QqIHZhbHVlIGZvciBhcmd1bWVudAojMyBzaG91bGQgaGF2ZSBiZWVuICpiZWZvcmUq
IHdlIGF0dGVtcHQgdG8gcmVwbGFjZSBzdHJuY3B5KCkgd2l0aAphbnl0aGluZy4KClRyYW5zZm9y
bWluZyBzb21ldGhpbmcgd2Uga25vdyB0byBiZSBicm9rZW4gd2l0aG91dCBmaXhpbmcgaXQgZmly
c3QKbWVhbnMgaXQgaXMgaW1wb3NzaWJsZSB0byBrbm93IGlmIHRoZSB0cmFuc2Zvcm1hdGlvbiBp
cyBjb3JyZWN0IG9yIG5vdC4KSGVuY2UgdGhlIG9yaWdpbmFsIHF1ZXN0aW9uLCBob3cgZG8gd2Ug
a25vdyB0aGVyZSBpcyBlbm91Z2ggc3BhY2UKYWZ0ZXIgY3AgdG8gc3RvcmUgdGhlIHN0cmluZz8K
CgpEYW5pZWwuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KS2dkYi1idWdyZXBvcnQgbWFpbGluZyBsaXN0CktnZGItYnVncmVwb3J0QGxpc3RzLnNvdXJj
ZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9r
Z2RiLWJ1Z3JlcG9ydAo=
