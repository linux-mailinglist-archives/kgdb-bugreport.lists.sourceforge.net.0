Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 462A3731FDB
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 15 Jun 2023 20:14:47 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1q9rUb-0005Nx-L5
	for lists+kgdb-bugreport@lfdr.de;
	Thu, 15 Jun 2023 18:14:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1q9rUZ-0005Nq-Em
 for kgdb-bugreport@lists.sourceforge.net;
 Thu, 15 Jun 2023 18:14:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TyNYAJPbrsk4+kV6DyQJsOygOqO+LfaaaEVKNin4xFM=; b=KsHk+Ti8YwslozAu0m1woUEjj4
 laZR+nU5iVWn1bzFpN9jO+bDp6s7+HWJrlsFBPgDO6O2CWqKKkXxjI8XfEwD6niOUcy+dddtovAql
 qzX0DudUYOdmKP8W8w++JnVLYfgF2gemp6f2x5ccJK1ysfEC9QL6z28TPs3QKoHWc0dg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TyNYAJPbrsk4+kV6DyQJsOygOqO+LfaaaEVKNin4xFM=; b=clizjVN73wMSWI3hm4F34q6SAL
 4LuRGEXk6f9hLc7/wj7V++kyMaJSWjSHNfkWk33j8dEAGazFo7bvc5qc0WQiCws4rBao5e+ydgOOS
 lGIu48st8ujypb1BxwR8pioj+RXP8bQRgAk5zH1YCRkl82X+8znPOmYfrwUYYixWKByk=;
Received: from mail-ed1-f49.google.com ([209.85.208.49])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1q9rUZ-0006e2-8F for kgdb-bugreport@lists.sourceforge.net;
 Thu, 15 Jun 2023 18:14:43 +0000
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-5169f614977so13432908a12.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 15 Jun 2023 11:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1686852874; x=1689444874;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TyNYAJPbrsk4+kV6DyQJsOygOqO+LfaaaEVKNin4xFM=;
 b=PkZi+UcA3xkz+7CVjKS4Ang+ChEw+qWMR+ASPys4FyQQ3Jlv+30XI0E2dIq8ZWk5mO
 +DMEkJ7XwFhOeRgzlZYQ+ZVtnXYoF+dNOu/3XmWfg/oU5FOKksDXnuoY+ZVTRUBEYNUz
 ejq5FSWFvIrHabndqXaM9l9wnQgzGPt8r/Pvs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686852874; x=1689444874;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TyNYAJPbrsk4+kV6DyQJsOygOqO+LfaaaEVKNin4xFM=;
 b=DaVhaUDHgtyDkS3lvaghKy3CWXDbCfbFMuWnS07k9UAe4s1mhTay7BzdJmAY6M4rJn
 f4BWnGwBPF7qu8BD0yX4HAXcenQO0gvKvGDDFyuwBruqeArIPugSAVmrOVdDbrxAMLYz
 zecxGN5vtPq2+x6YKiIB/ZNMbrQAYYW/g0+UO7o5w4heNnAJafrAZzhdyG5ctVIpMP8g
 GZbw8qIAgOvGFqKxW/ZLT1rFs5pMGd297N759HFKW1ThsLwcRGMOwXt9o3Asm4LzOlsG
 igaWsXI0diURJ1VpNX0XhRUPS9LKlSLYcpt83JKaq4WH5pIpOhAhBqOOJWtF+6b+Eram
 uaxg==
X-Gm-Message-State: AC+VfDzrEeNBbhXZm/TBB6lTsOnF7X1FfxZ3d968q5kN0MMl6WUpQDSP
 cGyeie4w81hxULmsKCSbxWxyfzm7QSyB3zsnkVTjhUsO
X-Google-Smtp-Source: ACHHUZ5qSXkNWc+PKxk6zbqEDXEaWzCBzpg2AtT4K3m351iHUjwkHVKPRgvuObru5VlVAaLAnoFh0g==
X-Received: by 2002:aa7:cd89:0:b0:510:82b4:844d with SMTP id
 x9-20020aa7cd89000000b0051082b4844dmr11496793edv.2.1686852874305; 
 Thu, 15 Jun 2023 11:14:34 -0700 (PDT)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com.
 [209.85.208.44]) by smtp.gmail.com with ESMTPSA id
 o8-20020aa7dd48000000b0051499320435sm9243379edw.14.2023.06.15.11.14.31
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Jun 2023 11:14:32 -0700 (PDT)
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-516500163b2so1330a12.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 15 Jun 2023 11:14:31 -0700 (PDT)
X-Received: by 2002:a50:d697:0:b0:510:b2b7:8a78 with SMTP id
 r23-20020a50d697000000b00510b2b78a78mr101415edi.5.1686852871368; Thu, 15 Jun
 2023 11:14:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230601213440.2488667-1-dianders@chromium.org>
 <20230601143109.v9.6.Ia3aeac89bb6751b682237e76e5ba594318e4b1aa@changeid>
In-Reply-To: <20230601143109.v9.6.Ia3aeac89bb6751b682237e76e5ba594318e4b1aa@changeid>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 15 Jun 2023 11:14:18 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XbnUZh2uQ5Sr3Dg=+Kiz7rfZVyP-zNQtXrV_NSsCTFcA@mail.gmail.com>
Message-ID: <CAD=FV=XbnUZh2uQ5Sr3Dg=+Kiz7rfZVyP-zNQtXrV_NSsCTFcA@mail.gmail.com>
To: Mark Rutland <mark.rutland@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Sumit Garg <sumit.garg@linaro.org>, 
 Daniel Thompson <daniel.thompson@linaro.org>, Marc Zyngier <maz@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Daniel, On Thu, Jun 1, 2023 at 2:37 PM Douglas Anderson
   <dianders@chromium.org> wrote: > > To save architectures from needing to wrap
    the call in #ifdefs, add a > stub no-op version of kgdb_nmicallback(), w
   [...] 
 
 Content analysis details:   (-0.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.208.49 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.208.49 listed in list.dnswl.org]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1q9rUZ-0006e2-8F
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
Cc: "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Lecopzer Chen <lecopzer.chen@mediatek.com>,
 Peter Zijlstra <peterz@infradead.org>, kgdb-bugreport@lists.sourceforge.net,
 ito-yuichi@fujitsu.com, linux-kernel@vger.kernel.org,
 Stephen Boyd <swboyd@chromium.org>, linux-perf-users@vger.kernel.org,
 Chen-Yu Tsai <wens@csie.org>, Jason Wessel <jason.wessel@windriver.com>,
 Thomas Gleixner <tglx@linutronix.de>, Masayoshi Mizuma <msys.mizuma@gmail.com>,
 Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

RGFuaWVsLAoKT24gVGh1LCBKdW4gMSwgMjAyMyBhdCAyOjM34oCvUE0gRG91Z2xhcyBBbmRlcnNv
biA8ZGlhbmRlcnNAY2hyb21pdW0ub3JnPiB3cm90ZToKPgo+IFRvIHNhdmUgYXJjaGl0ZWN0dXJl
cyBmcm9tIG5lZWRpbmcgdG8gd3JhcCB0aGUgY2FsbCBpbiAjaWZkZWZzLCBhZGQgYQo+IHN0dWIg
bm8tb3AgdmVyc2lvbiBvZiBrZ2RiX25taWNhbGxiYWNrKCksIHdoaWNoIHJldHVybnMgMSBpZiBp
dCBkaWRuJ3QKPiBoYW5kbGUgYW55dGhpbmcuCj4KPiBSZXZpZXdlZC1ieTogRGFuaWVsIFRob21w
c29uIDxkYW5pZWwudGhvbXBzb25AbGluYXJvLm9yZz4KPiBTaWduZWQtb2ZmLWJ5OiBEb3VnbGFz
IEFuZGVyc29uIDxkaWFuZGVyc0BjaHJvbWl1bS5vcmc+Cj4gLS0tCj4gSW4gdjkgdGhpcyBpcyB0
aGUgb25seSBrZ2RiIGRlcGVuZGVuY3kuIEknbSBhc3N1bWluZyBpdCBjb3VsZCBnbwo+IHRocm91
Z2ggdGhlIGFybTY0IHRyZWU/IElmIHRoYXQncyBub3QgYSBnb29kIGlkZWEsIHdlIGNvdWxkIGFs
d2F5cwo+IGNoYW5nZSB0aGUgcGF0Y2ggKCJhcm02NDoga2dkYjogUm91bmR1cCBjcHVzIHVzaW5n
IElQSSBhcyBOTUkiKSBub3QgdG8KPiBkZXBlbmQgb24gaXQgYnkgb25seSBjYWxsaW5nIGtnZGJf
bm1pY2FsbGJhY2soKSBpZiBDT05GSUdfS0dEQiBpcyBub3QKPiBkZWZpbmVkLgo+Cj4gQ2hhbmdl
cyBpbiB2OToKPiAtIEFkZGVkIG1pc3NpbmcgImlubGluZSIKPgo+IENoYW5nZXMgaW4gdjg6Cj4g
LSAiUHJvdmlkZSBhIHN0dWIga2dkYl9ubWljYWxsYmFjaygpIGlmICFDT05GSUdfS0dEQiIgbmV3
IGZvciB2OAo+Cj4gIGluY2x1ZGUvbGludXgva2dkYi5oIHwgMSArCj4gIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKQo+Cj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgva2dkYi5oIGIv
aW5jbHVkZS9saW51eC9rZ2RiLmgKPiBpbmRleCAyNThjZGRlOGQzNTYuLjc2ZTg5MWVlOWUzNyAx
MDA2NDQKPiAtLS0gYS9pbmNsdWRlL2xpbnV4L2tnZGIuaAo+ICsrKyBiL2luY2x1ZGUvbGludXgv
a2dkYi5oCj4gQEAgLTM2NSw1ICszNjUsNiBAQCBleHRlcm4gdm9pZCBrZ2RiX2ZyZWVfaW5pdF9t
ZW0odm9pZCk7Cj4gICNkZWZpbmUgZGJnX2xhdGVfaW5pdCgpCj4gIHN0YXRpYyBpbmxpbmUgdm9p
ZCBrZ2RiX3BhbmljKGNvbnN0IGNoYXIgKm1zZykge30KPiAgc3RhdGljIGlubGluZSB2b2lkIGtn
ZGJfZnJlZV9pbml0X21lbSh2b2lkKSB7IH0KPiArc3RhdGljIGlubGluZSBpbnQga2dkYl9ubWlj
YWxsYmFjayhpbnQgY3B1LCB2b2lkICpyZWdzKSB7IHJldHVybiAxOyB9CgpXaGF0IGRvIHlvdSB0
aGluayBhYm91dCBsYW5kaW5nIGp1c3QgJHtTVUJKRUNUfSBwYXRjaCBpbiBrZ2RiIHJpZ2h0Cm5v
dyBzbyBpdCBjYW4gZW5kIHVwIGluIHY2LjUtcmMxPyBJdCBzZWVtcyBsaWtlIHRoaXMgc2VyaWVz
IGlzCmN1cnJlbnRseSBibG9ja2VkIG9uIE1hcmsgZ2V0dGluZyBhIHNwYXJlIG1vbWVudCBhbmQg
aXQgc2VlbXMgdW5saWtlbHkKdGhhdCdsbCBoYXBwZW4gdGhpcyBjeWNsZS4gSWYgd2UgYXQgbGVh
c3QgbGFuZCB0aGUga2dkYiBwYXRjaCB0aGVuIGl0CndvdWxkIG1ha2UgdGhpbmdzIGFsbCB0aGF0
IG11Y2ggZWFzaWVyIHRvIGxhbmQgaW4gdGhlIG5leHQgY3ljbGUuIFRoZQprZ2RiIHBhdGNoIGZl
ZWxzIGxpa2UgaXQgY2FuIG1ha2Ugc2Vuc2Ugb24gaXRzIG93bi4uLgoKLURvdWcKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpLZ2RiLWJ1Z3JlcG9ydCBt
YWlsaW5nIGxpc3QKS2dkYi1idWdyZXBvcnRAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8v
bGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2tnZGItYnVncmVwb3J0Cg==
