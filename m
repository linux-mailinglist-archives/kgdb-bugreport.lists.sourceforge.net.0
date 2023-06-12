Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A33C472C6F3
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 12 Jun 2023 16:08:50 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1q8iDx-0004Fy-13
	for lists+kgdb-bugreport@lfdr.de;
	Mon, 12 Jun 2023 14:08:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1q8iDv-0004Fs-M3
 for kgdb-bugreport@lists.sourceforge.net;
 Mon, 12 Jun 2023 14:08:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3HGBKm3rUtk6a6owuw8xAw+5Ji2XRPu2JkI1sZuIh9k=; b=G+BNwGuUuTxvXZ2FEu7R4OYOGt
 /rvSpRNmuIUoIFgCpXr3TyZO7lS4DN4ZnjrRi3NlSURqn31BfsTpjGloJQvKMm4YqlEiptYEfNNJS
 PvsiIbTE7Jn89D4QoocaGh8nsHSQKKjIegHogv22DwLAsIqVAIJ3SnfN8f8p6/b6LIPE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3HGBKm3rUtk6a6owuw8xAw+5Ji2XRPu2JkI1sZuIh9k=; b=MHveiUAHNYmGfLMjyvUgAe92L+
 Bz2luxiU/hhPGHr/gg3LZDWhPbzb138zVJkT1rka7pNqkMZeNHuARD0w0jYRAoXylmdmuFU0mLfTG
 x7/+7WOk4455WaWy3V529iVG1bJgz9A5H/W3NGLY1CpMyEOeQ2XlSgSxNRNhNuf7/stc=;
Received: from mail-lj1-f169.google.com ([209.85.208.169])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1q8iDr-000391-GU for kgdb-bugreport@lists.sourceforge.net;
 Mon, 12 Jun 2023 14:08:48 +0000
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-2b1af9ef7a9so51654131fa.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 12 Jun 2023 07:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1686578916; x=1689170916;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3HGBKm3rUtk6a6owuw8xAw+5Ji2XRPu2JkI1sZuIh9k=;
 b=aQQ1e+jMiu6JCLzr3bRdrRVj4fjTqmtySncgHgaLSMHj8BglAAG6J2jRqSOg8SZFvS
 XCPO3MztIvHSAVEiuxC1xQLqzU9vad15peI0rx/jihbg9OUzuooUh4TvAONtv+GBA/b9
 C2R1+CYDUOnq1etKJfbB2bWMj/O0vl1N6ipqM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686578916; x=1689170916;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3HGBKm3rUtk6a6owuw8xAw+5Ji2XRPu2JkI1sZuIh9k=;
 b=RBVXO9tiBuImMTkmgYZweik50ieujGk2Mmq+XpGCUze94k+6CrdWq3uGvNEUUc75Kb
 UfXfffhOU/NrTrrumEhlSy7B91H/FctPQ7gxUDhlzVnGBUVQBWptnj9U8fjLlmPV+qe1
 Gn5Fi36nNo3hKmk+tlPfaxx4k4Eb6GZZ44L7etho5yNa6eGk+vEUZM1OVLheQo1rF6Xk
 Aci4T6t8yThb1bruTS7bwOU9wkaaB4u14fRUNfmwfVBPEEpI0jJW8yItM8vqav/baFkC
 b8nBCwAypCd0/0YrgR8bdOHquWwhBHu92waulmpFXXJ3NP0JP9mpojSYxitcGVAq5ptG
 HQCw==
X-Gm-Message-State: AC+VfDyWPTdRiYtrJUJi/Wx7x8ZuOJBLHPJl+CCFF9pZVFgXG6m3ZhNo
 VfkUnD6VROGE7z4RONxhrqgAQIC25SzNBrVeFXhM9Q==
X-Google-Smtp-Source: ACHHUZ7Ai/ruKRLej0RFiX0qnG42cnBGYEVzpMegTppLIpwV9uOUab5YG8lPP9pIOhr1RTInKMd+NQ==
X-Received: by 2002:a19:5f0e:0:b0:4dd:9f86:859d with SMTP id
 t14-20020a195f0e000000b004dd9f86859dmr4141347lfb.13.1686578515436; 
 Mon, 12 Jun 2023 07:01:55 -0700 (PDT)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com.
 [209.85.208.43]) by smtp.gmail.com with ESMTPSA id
 f27-20020a170906391b00b0097888b3b5a7sm5245138eje.31.2023.06.12.07.01.55
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Jun 2023 07:01:55 -0700 (PDT)
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-516500163b2so9008a12.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 12 Jun 2023 07:01:55 -0700 (PDT)
X-Received: by 2002:a50:9fad:0:b0:505:863:d85f with SMTP id
 c42-20020a509fad000000b005050863d85fmr200065edf.4.1686578149114; Mon, 12 Jun
 2023 06:55:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230519101840.v5.18.Ia44852044cdcb074f387e80df6b45e892965d4a1@changeid>
 <20230519101840.v5.15.Ic55cb6f90ef5967d8aaa2b503a4e67c753f64d3a@changeid>
 <ZIb0hd8djM+jJviF@FVFF77S0Q05N>
In-Reply-To: <ZIb0hd8djM+jJviF@FVFF77S0Q05N>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 12 Jun 2023 06:55:37 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WyLKygSsArCaSzid47Rz5=ozR6Yh9L6Q3JStpzF9Tn9w@mail.gmail.com>
Message-ID: <CAD=FV=WyLKygSsArCaSzid47Rz5=ozR6Yh9L6Q3JStpzF9Tn9w@mail.gmail.com>
To: Mark Rutland <mark.rutland@arm.com>
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Mark, On Mon, Jun 12, 2023 at 3:33 AM Mark Rutland <mark.rutland@arm.com>
    wrote: > > On Fri, May 19, 2023 at 10:18:39AM -0700, Douglas Anderson wrote:
    > > On arm64, NMI support needs to be detected at run [...] 
 
 Content analysis details:   (-0.9 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.208.169 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.208.169 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1q8iDr-000391-GU
Subject: Re: [Kgdb-bugreport] [PATCH v5 15/18] watchdog/perf: Add a weak
 function for an arch to detect if perf can use NMIs
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
Cc: Ian Rogers <irogers@google.com>, ito-yuichi@fujitsu.com,
 Lecopzer Chen <lecopzer.chen@mediatek.com>, ravi.v.shankar@intel.com,
 Catalin Marinas <catalin.marinas@arm.com>, ricardo.neri@intel.com,
 Stephane Eranian <eranian@google.com>, sparclinux@vger.kernel.org,
 Guenter Roeck <groeck@chromium.org>, Will Deacon <will@kernel.org>,
 Daniel Thompson <daniel.thompson@linaro.org>, Andi Kleen <ak@linux.intel.com>,
 Marc Zyngier <maz@kernel.org>, christophe.leroy@csgroup.eu,
 Chen-Yu Tsai <wens@csie.org>, Matthias Kaehlcke <mka@chromium.org>,
 kgdb-bugreport@lists.sourceforge.net, Masayoshi Mizuma <msys.mizuma@gmail.com>,
 Petr Mladek <pmladek@suse.com>, Tzung-Bi Shih <tzungbi@chromium.org>,
 npiggin@gmail.com, Stephen Boyd <swboyd@chromium.org>,
 Pingfan Liu <kernelfans@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, mpe@ellerman.id.au,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 davem@davemloft.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

TWFyaywKCk9uIE1vbiwgSnVuIDEyLCAyMDIzIGF0IDM6MzPigK9BTSBNYXJrIFJ1dGxhbmQgPG1h
cmsucnV0bGFuZEBhcm0uY29tPiB3cm90ZToKPgo+IE9uIEZyaSwgTWF5IDE5LCAyMDIzIGF0IDEw
OjE4OjM5QU0gLTA3MDAsIERvdWdsYXMgQW5kZXJzb24gd3JvdGU6Cj4gPiBPbiBhcm02NCwgTk1J
IHN1cHBvcnQgbmVlZHMgdG8gYmUgZGV0ZWN0ZWQgYXQgcnVudGltZS4gQWRkIGEgd2Vhawo+ID4g
ZnVuY3Rpb24gdG8gdGhlIHBlcmYgaGFyZGxvY2t1cCBkZXRlY3RvciBzbyB0aGF0IGFuIGFyY2hp
dGVjdHVyZSBjYW4KPiA+IGltcGxlbWVudCBpdCB0byBkZXRlY3Qgd2hldGhlciBOTUlzIGFyZSBh
dmFpbGFibGUuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogRG91Z2xhcyBBbmRlcnNvbiA8ZGlhbmRl
cnNAY2hyb21pdW0ub3JnPgo+ID4gLS0tCj4gPiBXaGlsZSBJIHdvbid0IG9iamVjdCB0byB0aGlz
IHBhdGNoIGxhbmRpbmcsIEkgY29uc2lkZXIgaXQgcGFydCBvZiB0aGUKPiA+IGFybTY0IHBlcmYg
aGFyZGxvY2t1cCBlZmZvcnQuIEkgd291bGQgYmUgT0sgd2l0aCB0aGUgZWFybGllciBwYXRjaGVz
Cj4gPiBpbiB0aGUgc2VyaWVzIGxhbmRpbmcgYW5kIHRoZW4gbm90IGxhbmRpbmcgJHtTVUJKRUNU
fSBwYXRjaCBub3IKPiA+IGFueXRoaW5nIGVsc2UgbGF0ZXIuCj4KPiBGV0lXLCBldmVyeXRoaW5n
IHByaW9yIHRvIHRoaXMgbG9va3MgZmluZSB0byBtZSwgc28gSSByZWNrb24gaXQnZCBiZSB3b3J0
aAo+IHNwbGl0dGluZyB0aGUgc2VyaWVzIGhlcmUgYW5kIGdldHRpbmcgdGhlIGJ1ZGR5IGxvY2t1
cCBkZXRlY3RvciBpbiBmaXJzdCwgdG8KPiBhdm9pZCBhIGxvZy1qYW0gb24gYWxsIHRoZSBzdWJz
ZXF1ZW50IE5NSSBiaXRzLgoKSSB0aGluayB0aGUgd2hvbGUgc2VyaWVzIGhhcyBhbHJlYWR5IGxh
bmRlZCBpbiBBbmRyZXcncyB0cmVlLAppbmNsdWRpbmcgdGhlIGFybTY0ICJwZXJmIiBsb2NrdXAg
ZGV0ZWN0b3IgYml0cy4gSSBzYXcgYWxsIHRoZQpub3RpZmljYXRpb25zIGZyb20gQW5kcmV3IGdv
IHRocm91Z2ggb3ZlciB0aGUgd2Vla2VuZCB0aGF0IHRoZXkgd2VyZQptb3ZlZCBmcm9tIGFuICJ1
bnN0YWJsZSIgYnJhbmNoIHRvIGEgInN0YWJsZSIgb25lIGFuZCBJIHNlZSB0aGVtIGF0OgoKaHR0
cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvYWtwbS9tbS5naXQv
bG9nLz9oPW1tLW5vbm1tLXN0YWJsZQoKV2hlbiBJIGZpcnN0IHNhdyBBbmRlcncgbGFuZCB0aGUg
YXJtNjQgcGVyZiBsb2NrdXAgZGV0ZWN0b3IgYml0cyBpbgpoaXMgdW5zdGFibGUgYnJhbmNoIHNl
dmVyYWwgd2Vla3MgYWdvLCBJIHNlbnQgYSBwcml2YXRlIG1lc3NhZ2UgdG8gdGhlCmFybTY0IG1h
aW50YWluZXJzICh5b3Vyc2VsZiBpbmNsdWRlZCkgdG8gbWFrZSBzdXJlIHlvdSB3ZXJlIGF3YXJl
IG9mCml0IGFuZCB0aGF0IGl0IGhhZG4ndCBiZWVuIGNhdWdodCBpbiBtYWlsIGZpbHRlcnMuIEkg
Z290IHRoZQppbXByZXNzaW9uIHRoYXQgZXZlcnl0aGluZyB3YXMgT0suIElzIHRoYXQgbm90IHRo
ZSBjYXNlPwoKCi1Eb3VnCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KS2dkYi1idWdyZXBvcnQgbWFpbGluZyBsaXN0CktnZGItYnVncmVwb3J0QGxpc3Rz
LnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0
aW5mby9rZ2RiLWJ1Z3JlcG9ydAo=
