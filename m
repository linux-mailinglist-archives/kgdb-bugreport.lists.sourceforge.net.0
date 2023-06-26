Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C4B73E229
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 26 Jun 2023 16:30:53 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1qDnEx-0006iR-Ub
	for lists+kgdb-bugreport@lfdr.de;
	Mon, 26 Jun 2023 14:30:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daniel.thompson@linaro.org>) id 1qDnEv-0006iL-Gv
 for kgdb-bugreport@lists.sourceforge.net;
 Mon, 26 Jun 2023 14:30:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sOo0XC/Y4flNUsbiJzBoRTnJAgB9VDv1XM+zJzFrca0=; b=HdDHQjoOGdLGDzAkG3ecX6em6w
 Xz0Ux4oNMIP7FZBhPZDg5pjnaFWPUQuMwUizDp8KQKO2X4nNWcgzspGyX+GYxNw2ffQQSlfMj1yTm
 68GyEeLQ589fj6I4854sNYVi88DC0HJ1gonAcXZtd0GnauLvmdM/0rVQUV74gcCFTyvM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=sOo0XC/Y4flNUsbiJzBoRTnJAgB9VDv1XM+zJzFrca0=; b=Q5+GclBk6nbEZH/3LZrpsPfkSN
 AnhD0PwFIcHG1FtuzcmJra9d4OAI6tmGMZ36OFQF9/NlJUKaUzGMLypKy3E0iav5S+lapDolyuQsG
 GBYyT+YK6Bt2+Lr8eMocTjTmSGquYyzEbFCRXIZm/MXkqDj9zJ8EB/3MsnOjdx5LK++M=;
Received: from mail-wm1-f41.google.com ([209.85.128.41])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qDnEt-00FP5s-Uy for kgdb-bugreport@lists.sourceforge.net;
 Mon, 26 Jun 2023 14:30:49 +0000
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-3fb4146e8fcso2417015e9.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 26 Jun 2023 07:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687789841; x=1690381841;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=sOo0XC/Y4flNUsbiJzBoRTnJAgB9VDv1XM+zJzFrca0=;
 b=QsW3/nHLhkexzxGA0twe/x2qW+MofrKWc20XzfvTwk9ZpPAmfEi5ih1e5YIuIT2lNC
 tjzCItcBDxFEFpbD7plDyGkfJ6B6tktDh1RDsc6ybYsCUOAiNzUnoB7b3UCawebRTjP+
 IoVoceQUvr2vN6a2MOQFkk1b5sL3SecejNjv+vqiS03ImU7+AJ6TLazciDLoJy1LmNi/
 QDPMsiuJuIIhwrC2wnDBhy0BD7hQrTbGaXffjQQ/QtmqFhMAfZPpTXoSijvnZwqpNWbS
 O7tcEJhLj/e72X+eQkt3abY6eNBxVugwOG2ALiWE2YSEe8VNPf1Bl5GntO/vsmEX50nc
 9ayg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687789841; x=1690381841;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sOo0XC/Y4flNUsbiJzBoRTnJAgB9VDv1XM+zJzFrca0=;
 b=hiPSa793yMNgt0XhqzgMa6f7QrocwAED7jgyMxisKDd46Qmo0V3LhrQTucdjON5is6
 UV0VurnSaQHWQ0dCnam9WOZ3Xdq5KSp9umvYVEgYo/neFI01vF6pn9+95FjDmKIfb5Xu
 Jxi5bIepWMMEx5ttNX2ULRHMSuHiwLNwEYfxZnQJ0nmHZuSS6cIEmEkKPAmN10TTHgsU
 YG/w3WtOpKc5A/vsMResMNGIFxzwnJcqLac30zUVKsD/M1tMfmLVDhjDuMbgOQZqa3ZM
 T40Zp4impQVEhNuKjIhnHXTvNzELfreGjZAS+gCmlvLkPq9XzufLZLZFtglZH5xMr2xH
 Om9Q==
X-Gm-Message-State: AC+VfDwwgys1W/Wxld7HTlrBEisU0Y5SpiQ+uDNG/w0Kw4WSPH1Z3AiB
 h424iDn+XC4XK8HI0+9fPrQ9UA==
X-Google-Smtp-Source: ACHHUZ6VWP4raj9cfLAIOeEgLIdxBNSr9wdsVkIQVnyoeIOHSC4oDNzgvxTcgh/C0ZjUg/zNHcMRlg==
X-Received: by 2002:a05:600c:10d1:b0:3f7:a20a:561d with SMTP id
 l17-20020a05600c10d100b003f7a20a561dmr27638549wmd.8.1687789841362; 
 Mon, 26 Jun 2023 07:30:41 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 t15-20020a0560001a4f00b00313f676832bsm1380811wry.93.2023.06.26.07.30.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jun 2023 07:30:40 -0700 (PDT)
Date: Mon, 26 Jun 2023 15:30:38 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Doug Anderson <dianders@chromium.org>
Message-ID: <20230626143038.GB95170@aspen.lan>
References: <20230601213440.2488667-1-dianders@chromium.org>
 <20230601143109.v9.6.Ia3aeac89bb6751b682237e76e5ba594318e4b1aa@changeid>
 <CAD=FV=XbnUZh2uQ5Sr3Dg=+Kiz7rfZVyP-zNQtXrV_NSsCTFcA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAD=FV=XbnUZh2uQ5Sr3Dg=+Kiz7rfZVyP-zNQtXrV_NSsCTFcA@mail.gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Thu, Jun 15, 2023 at 11:14:18AM -0700, Doug Anderson wrote:
    > Daniel, > > On Thu, Jun 1, 2023 at 2:37 PM Douglas Anderson <dianders@chromium.org>
    wrote: > > > > To save architectures from needing [...] 
 
 Content analysis details:   (-0.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.128.41 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.128.41 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1qDnEt-00FP5s-Uy
Subject: Re: [Kgdb-bugreport] [PATCH v9 6/7] kgdb: Provide a stub
 kgdb_nmicallback() if !CONFIG_KGDB
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
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Lecopzer Chen <lecopzer.chen@mediatek.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Jason Wessel <jason.wessel@windriver.com>, ito-yuichi@fujitsu.com,
 linux-kernel@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
 linux-perf-users@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
 Marc Zyngier <maz@kernel.org>, kgdb-bugreport@lists.sourceforge.net,
 Thomas Gleixner <tglx@linutronix.de>, Masayoshi Mizuma <msys.mizuma@gmail.com>,
 Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

T24gVGh1LCBKdW4gMTUsIDIwMjMgYXQgMTE6MTQ6MThBTSAtMDcwMCwgRG91ZyBBbmRlcnNvbiB3
cm90ZToKPiBEYW5pZWwsCj4KPiBPbiBUaHUsIEp1biAxLCAyMDIzIGF0IDI6MzfigK9QTSBEb3Vn
bGFzIEFuZGVyc29uIDxkaWFuZGVyc0BjaHJvbWl1bS5vcmc+IHdyb3RlOgo+ID4KPiA+IFRvIHNh
dmUgYXJjaGl0ZWN0dXJlcyBmcm9tIG5lZWRpbmcgdG8gd3JhcCB0aGUgY2FsbCBpbiAjaWZkZWZz
LCBhZGQgYQo+ID4gc3R1YiBuby1vcCB2ZXJzaW9uIG9mIGtnZGJfbm1pY2FsbGJhY2soKSwgd2hp
Y2ggcmV0dXJucyAxIGlmIGl0IGRpZG4ndAo+ID4gaGFuZGxlIGFueXRoaW5nLgo+ID4KPiA+IFJl
dmlld2VkLWJ5OiBEYW5pZWwgVGhvbXBzb24gPGRhbmllbC50aG9tcHNvbkBsaW5hcm8ub3JnPgo+
ID4gU2lnbmVkLW9mZi1ieTogRG91Z2xhcyBBbmRlcnNvbiA8ZGlhbmRlcnNAY2hyb21pdW0ub3Jn
Pgo+ID4gLS0tCj4gPiBJbiB2OSB0aGlzIGlzIHRoZSBvbmx5IGtnZGIgZGVwZW5kZW5jeS4gSSdt
IGFzc3VtaW5nIGl0IGNvdWxkIGdvCj4gPiB0aHJvdWdoIHRoZSBhcm02NCB0cmVlPyBJZiB0aGF0
J3Mgbm90IGEgZ29vZCBpZGVhLCB3ZSBjb3VsZCBhbHdheXMKPiA+IGNoYW5nZSB0aGUgcGF0Y2gg
KCJhcm02NDoga2dkYjogUm91bmR1cCBjcHVzIHVzaW5nIElQSSBhcyBOTUkiKSBub3QgdG8KPiA+
IGRlcGVuZCBvbiBpdCBieSBvbmx5IGNhbGxpbmcga2dkYl9ubWljYWxsYmFjaygpIGlmIENPTkZJ
R19LR0RCIGlzIG5vdAo+ID4gZGVmaW5lZC4KPiA+Cj4gPiBDaGFuZ2VzIGluIHY5Ogo+ID4gLSBB
ZGRlZCBtaXNzaW5nICJpbmxpbmUiCj4gPgo+ID4gQ2hhbmdlcyBpbiB2ODoKPiA+IC0gIlByb3Zp
ZGUgYSBzdHViIGtnZGJfbm1pY2FsbGJhY2soKSBpZiAhQ09ORklHX0tHREIiIG5ldyBmb3IgdjgK
PiA+Cj4gPiAgaW5jbHVkZS9saW51eC9rZ2RiLmggfCAxICsKPiA+ICAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKykKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9rZ2RiLmgg
Yi9pbmNsdWRlL2xpbnV4L2tnZGIuaAo+ID4gaW5kZXggMjU4Y2RkZThkMzU2Li43NmU4OTFlZTll
MzcgMTAwNjQ0Cj4gPiAtLS0gYS9pbmNsdWRlL2xpbnV4L2tnZGIuaAo+ID4gKysrIGIvaW5jbHVk
ZS9saW51eC9rZ2RiLmgKPiA+IEBAIC0zNjUsNSArMzY1LDYgQEAgZXh0ZXJuIHZvaWQga2dkYl9m
cmVlX2luaXRfbWVtKHZvaWQpOwo+ID4gICNkZWZpbmUgZGJnX2xhdGVfaW5pdCgpCj4gPiAgc3Rh
dGljIGlubGluZSB2b2lkIGtnZGJfcGFuaWMoY29uc3QgY2hhciAqbXNnKSB7fQo+ID4gIHN0YXRp
YyBpbmxpbmUgdm9pZCBrZ2RiX2ZyZWVfaW5pdF9tZW0odm9pZCkgeyB9Cj4gPiArc3RhdGljIGlu
bGluZSBpbnQga2dkYl9ubWljYWxsYmFjayhpbnQgY3B1LCB2b2lkICpyZWdzKSB7IHJldHVybiAx
OyB9Cj4KPiBXaGF0IGRvIHlvdSB0aGluayBhYm91dCBsYW5kaW5nIGp1c3QgJHtTVUJKRUNUfSBw
YXRjaCBpbiBrZ2RiIHJpZ2h0Cj4gbm93IHNvIGl0IGNhbiBlbmQgdXAgaW4gdjYuNS1yYzE/IEl0
IHNlZW1zIGxpa2UgdGhpcyBzZXJpZXMgaXMKPiBjdXJyZW50bHkgYmxvY2tlZCBvbiBNYXJrIGdl
dHRpbmcgYSBzcGFyZSBtb21lbnQgYW5kIGl0IHNlZW1zIHVubGlrZWx5Cj4gdGhhdCdsbCBoYXBw
ZW4gdGhpcyBjeWNsZS4gSWYgd2UgYXQgbGVhc3QgbGFuZCB0aGUga2dkYiBwYXRjaCB0aGVuIGl0
Cj4gd291bGQgbWFrZSB0aGluZ3MgYWxsIHRoYXQgbXVjaCBlYXNpZXIgdG8gbGFuZCBpbiB0aGUg
bmV4dCBjeWNsZS4gVGhlCj4ga2dkYiBwYXRjaCBmZWVscyBsaWtlIGl0IGNhbiBtYWtlIHNlbnNl
IG9uIGl0cyBvd24uLi4KClllcywgZ3JhYmJpbmcgdGhpcyBvbmUgc2hvdWxkIGJlIGZpbmUhCgoK
RGFuaWVsLgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CktnZGItYnVncmVwb3J0IG1haWxpbmcgbGlzdApLZ2RiLWJ1Z3JlcG9ydEBsaXN0cy5zb3VyY2Vm
b3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8va2dk
Yi1idWdyZXBvcnQK
