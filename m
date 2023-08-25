Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 315A178924C
	for <lists+kgdb-bugreport@lfdr.de>; Sat, 26 Aug 2023 01:23:29 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1qZg9G-00060P-SL
	for lists+kgdb-bugreport@lfdr.de;
	Fri, 25 Aug 2023 23:23:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <swboyd@chromium.org>) id 1qZg9F-00060J-Gl
 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 25 Aug 2023 23:23:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:References:In-Reply-To:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4y/MCOutpdQ9jrdBYlOHctxvB4AexelxGOeGhkirgy8=; b=Tq9vyO2EqxPdLvI7+kHhr7gUSP
 SONxTFvWA59gOlxcdEifmCJmybRt1ALOPOOHl7SBmXGyPlPamDiA7jRRg1Cqw4Rl3K14iYIvBtwuF
 6qXu28OIareyTySsxiQfTbiJWkU/sfntf2RHyefupzMbWQRI1cEkpUQ4/2Les1AmWHAI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :References:In-Reply-To:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4y/MCOutpdQ9jrdBYlOHctxvB4AexelxGOeGhkirgy8=; b=WmT1FD7LMK2xa6ba6uV3xRJydJ
 PZjZM0ePt+3YdsAFjK/Dv+FOyljWfmCuJhU38kOaS9i4aPgdlteSwSxZ0fR4AsYsZgebBxksxe1If
 a5aHGo/L4M00XoICDTkbwjBVX8azF1yTObA2D64rVtCjEUwUw9xyQe23x0PxM4RH9Xu4=;
Received: from mail-lf1-f43.google.com ([209.85.167.43])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qZg9F-00Fdvn-Ow for kgdb-bugreport@lists.sourceforge.net;
 Fri, 25 Aug 2023 23:23:26 +0000
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-50079d148aeso2156554e87.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 25 Aug 2023 16:23:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1693005799; x=1693610599;
 h=content-transfer-encoding:cc:to:subject:message-id:date:user-agent
 :from:references:in-reply-to:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4y/MCOutpdQ9jrdBYlOHctxvB4AexelxGOeGhkirgy8=;
 b=U8NKwCCNSifsc2lSTaq4WiTeE1T6YuPABAyz74CRhWhIPiyirbpLKqOOyHPBIdfVD0
 Itd8MKaLEcUQ+vuDtqtCUcpbE2MedhssvMzV160oBFM/wKbNn9o4q7ThtKK6zbFpzaiE
 BMDad/zHG8StzWD3C1o3qgOLzhAp0vVKoTLs4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693005799; x=1693610599;
 h=content-transfer-encoding:cc:to:subject:message-id:date:user-agent
 :from:references:in-reply-to:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=4y/MCOutpdQ9jrdBYlOHctxvB4AexelxGOeGhkirgy8=;
 b=LbKKUlRU6ynjfnwjeA+a2j8OJw/u5BsSSbzhfc6tezl38UtUEHrX5BMNMVuP3VWnYw
 lMT4wQVP6lhgv556qLq7YELtTah4oKvEqtf/YiRttw+qL0l3m5PsZuHU9jGqxmiV/wiK
 jJV4xnOng2t/mOoG4FaTCCgH/KeoK+gspHUFl9mbMH318nIUiuyWXWBs8ENQXaO/FWhp
 tBJ16THCEukKg5T4uV48T0ZVf9TgJk50JnC7ytFMbK3MIL/kknFvn2BWcF0aGD+nnMzG
 O40kyPKXgQ0cAQ+o4ZNxS6g4EyKEpK8n9F+2hB9js0VNVX9lSEKoeyYp0Klm9CkmTL47
 4SdQ==
X-Gm-Message-State: AOJu0Yz7yPazuphVis8pjn4gU046jWq7+IYAFDonJvIgLXMNJRsy/kiP
 agmZDzjNy7MaIHorz7p23yqkPFm1rIdasB50hHDycg==
X-Google-Smtp-Source: AGHT+IEHxDRNRzDhD7J/HEqvUIEgnQd72FT7NvreGyXrsE98RFOiKe9Js51h5J1CykBkagVO4tydb+PQ0x7QUhyImSE=
X-Received: by 2002:ac2:5f4b:0:b0:500:9ee2:15f with SMTP id
 11-20020ac25f4b000000b005009ee2015fmr3398223lfz.46.1693005799136; Fri, 25 Aug
 2023 16:23:19 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 25 Aug 2023 18:23:18 -0500
MIME-Version: 1.0
In-Reply-To: <CAD=FV=U24kF7WbZPKMbk=kJMU14+yFJXpGWWfj0fPbA9J6h0Eg@mail.gmail.com>
References: <20230824153233.1006420-1-dianders@chromium.org>
 <20230824083012.v11.4.Ie6c132b96ebbbcddbf6954b9469ed40a6960343c@changeid>
 <CAE-0n52iVDgZa8XT8KTMj12c_ESSJt7f7A0fuZ_oAMMqpGcSzA@mail.gmail.com>
 <CAD=FV=U24kF7WbZPKMbk=kJMU14+yFJXpGWWfj0fPbA9J6h0Eg@mail.gmail.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Fri, 25 Aug 2023 18:23:18 -0500
Message-ID: <CAE-0n514xGWz1yaF84zL=QBCQcMwct+pu8nLBgRHPq6+DE3g5g@mail.gmail.com>
To: Doug Anderson <dianders@chromium.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Quoting Doug Anderson (2023-08-25 16:02:46) > On Fri, Aug
   25, 2023 at 3:27 PM Stephen Boyd <swboyd@chromium.org> wrote: > > > > Quoting
    Douglas Anderson (2023-08-24 08:30:30) > > > diff --git a/arch [...] 
 
 Content analysis details:   (-0.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.167.43 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.167.43 listed in wl.mailspike.net]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qZg9F-00Fdvn-Ow
Subject: Re: [Kgdb-bugreport] [PATCH v11 4/6] arm64: smp: Add arch support
 for backtrace using pseudo-NMI
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
 Lecopzer Chen <lecopzer.chen@mediatek.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Ingo Molnar <mingo@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Marc Zyngier <maz@kernel.org>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Ard Biesheuvel <ardb@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 kgdb-bugreport@lists.sourceforge.net, Masayoshi Mizuma <msys.mizuma@gmail.com>,
 Valentin Schneider <vschneid@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 Josh Poimboeuf <jpoimboe@kernel.org>, linux-arm-kernel@lists.infradead.org,
 D Scott Phillips <scott@os.amperecomputing.com>, ito-yuichi@fujitsu.com,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

UXVvdGluZyBEb3VnIEFuZGVyc29uICgyMDIzLTA4LTI1IDE2OjAyOjQ2KQo+IE9uIEZyaSwgQXVn
IDI1LCAyMDIzIGF0IDM6MjfigK9QTSBTdGVwaGVuIEJveWQgPHN3Ym95ZEBjaHJvbWl1bS5vcmc+
IHdyb3RlOgo+ID4KPiA+IFF1b3RpbmcgRG91Z2xhcyBBbmRlcnNvbiAoMjAyMy0wOC0yNCAwODoz
MDozMCkKPiA+ID4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvaW5jbHVkZS9hc20vaXJxLmggYi9h
cmNoL2FybTY0L2luY2x1ZGUvYXNtL2lycS5oCj4gPiA+Cj4gPiA+ICBzdGF0aWMgaW50IGlwaV9p
cnFfYmFzZSBfX3JlYWRfbW9zdGx5Owo+ID4gPiAgc3RhdGljIGludCBucl9pcGkgX19yZWFkX21v
c3RseSA9IE5SX0lQSTsKPiA+ID4gLXN0YXRpYyBzdHJ1Y3QgaXJxX2Rlc2MgKmlwaV9kZXNjW05S
X0lQSV0gX19yZWFkX21vc3RseTsKPiA+ID4gK3N0YXRpYyBzdHJ1Y3QgaXJxX2Rlc2MgKmlwaV9k
ZXNjW01BWF9JUEldIF9fcmVhZF9tb3N0bHk7Cj4gPgo+ID4gU2lkZSBub3RlOiBpdCB3b3VsZCBi
ZSBuaWNlIHRvIG1hcmsgaXBpX2Rlc2MgYXMgX19yb19hZnRlcl9pbml0LiBTYW1lCj4gPiBmb3Ig
bnJfaXBpIGFuZCBpcGlfaXJxX2Jhc2UuCj4KPiBJJ2QgcmF0aGVyIG5vdCBjaGFuZ2UgaXQgaW4g
dGhpcyBwYXRjaCBzaW5jZSBpdCdzIGEgcHJlLWV4aXN0aW5nIGFuZAo+IHNlcGFyYXRlIGlzc3Vl
LCBidXQgSSBjYW4gYWRkIGEgcGF0Y2ggdG8gdGhlIGVuZCBvZiB0aGUgc2VyaWVzIGZvcgo+IHRo
YXQgaWYgSSBlbmQgdXAgc3Bpbm5pbmcgaXQuIE90aGVyd2lzZSBJIGNhbiBzZW5kIGEgZm9sbG93
LXVwIHBhdGNoCj4gZm9yIGl0LgoKT2YgY291cnNlLiBEb24ndCBjaGFuZ2UgaXQgaW4gdGhpcyBw
YXRjaC4KCj4KPgo+ID4gPiAgc3RhdGljIHZvaWQgaXBpX3NldHVwKGludCBjcHUpOwo+ID4gPgo+
ID4gPiBAQCAtODQ1LDYgKzg1MiwyMiBAQCBzdGF0aWMgdm9pZCBfX25vcmV0dXJuIGlwaV9jcHVf
Y3Jhc2hfc3RvcCh1bnNpZ25lZCBpbnQgY3B1LCBzdHJ1Y3QgcHRfcmVncyAqcmVncwo+ID4gPiAg
I2VuZGlmCj4gPiA+ICB9Cj4gPiA+Cj4gPiA+ICtzdGF0aWMgdm9pZCBhcm02NF9iYWNrdHJhY2Vf
aXBpKGNwdW1hc2tfdCAqbWFzaykKPiA+ID4gK3sKPiA+ID4gKyAgICAgICBfX2lwaV9zZW5kX21h
c2soaXBpX2Rlc2NbSVBJX0NQVV9CQUNLVFJBQ0VdLCBtYXNrKTsKPiA+ID4gK30KPiA+ID4gKwo+
ID4gPiArdm9pZCBhcmNoX3RyaWdnZXJfY3B1bWFza19iYWNrdHJhY2UoY29uc3QgY3B1bWFza190
ICptYXNrLCBpbnQgZXhjbHVkZV9jcHUpCj4gPgo+ID4gQ2FuIHRoaXMgYmUgJ2Jvb2wgZXhjbHVk
ZV9zZWxmJyBpbnN0ZWFkIG9mIGludD8gVGhhdCBtYXRjaGVzIGFsbCBvdGhlcgo+ID4gaW1wbGVt
ZW50YXRpb25zIGZyb20gd2hhdCBJIGNhbiB0ZWxsLgo+Cj4gTm9wZS4gU2VlIHRoZSBwYXJ0IG9m
IHRoZSBjb21taXQgbWVzc2FnZSB0aGF0IHNheXM6Cj4KPiBUaGlzIHBhdGNoIGRlcGVuZHMgb24g
Y29tbWl0IDM2NzU5ZTM0M2ZmOSAoIm5taV9iYWNrdHJhY2U6IGFsbG93Cj4gZXhjbHVkaW5nIGFu
IGFyYml0cmFyeSBDUFUiKSBzaW5jZSB0aGF0IGNvbW1pdCBjaGFuZ2VkIHRoZSBwcm90b3R5cGUK
PiBvZiBhcmNoX3RyaWdnZXJfY3B1bWFza19iYWNrdHJhY2UoKSwgd2hpY2ggdGhpcyBwYXRjaCBp
bXBsZW1lbnRzLgoKQWgsIG9rLiBTb3VuZHMgZmluZSB0aGVuLgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCktnZGItYnVncmVwb3J0IG1haWxpbmcgbGlz
dApLZ2RiLWJ1Z3JlcG9ydEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3Vy
Y2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8va2dkYi1idWdyZXBvcnQK
