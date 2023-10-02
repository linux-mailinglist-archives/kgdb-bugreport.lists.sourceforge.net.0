Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id ED53C7B5804
	for <lists+kgdb-bugreport@lfdr.de>; Mon,  2 Oct 2023 18:48:40 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1qnM62-0003ak-IR
	for lists+kgdb-bugreport@lfdr.de;
	Mon, 02 Oct 2023 16:48:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1qnM61-0003ad-IH
 for kgdb-bugreport@lists.sourceforge.net;
 Mon, 02 Oct 2023 16:48:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/tGIS2d4IoBhPIJormO2ARUKb4WPqFJw4stm8Ff0wEc=; b=W+Y8NZfmrepWPgvz+BgacJ1TMs
 XH2FNaHvyJcGnxqnK8N+2VIPW6tctfmyn9Dw+zgT0GljHd0v0e4JD6W+qFAGSSlE8sAa4JK+N3utw
 k7ftvfTu5kwSi2M4Wj7jN7Fxrwf/U1C9+okmNVooRGkFBxK7kGzjmunCYnyh5C8we2YQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/tGIS2d4IoBhPIJormO2ARUKb4WPqFJw4stm8Ff0wEc=; b=lw6Qt8x36vhg9NeK0xpx+nGFIa
 tvX2/VMailnPWGaLv+IZGwIEkgYNkmaPufxk8aAjgY4PzNSfhSDYt9N/zSvsU8jlJGIpX3dHmoUA7
 GOSD3FUMU9Asqoae6rqzEWlgVN0MSwwjC1VVptZpKAljHTThkKZa/Ei4B48Wjd1hlQnw=;
Received: from mail-ej1-f53.google.com ([209.85.218.53])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qnM5x-0008Eq-VK for kgdb-bugreport@lists.sourceforge.net;
 Mon, 02 Oct 2023 16:48:38 +0000
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-9b2cee40de8so743727466b.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 02 Oct 2023 09:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1696265304; x=1696870104;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/tGIS2d4IoBhPIJormO2ARUKb4WPqFJw4stm8Ff0wEc=;
 b=oZTgVFd1OVlojtTHUs8mywYjIjFuQi1APrcnpQvpKX963rIugaMYJylp0kbpl6xS5X
 y9bKvEHA3Wfma9saQiGw0RbUgVDxFarCjivbhtbeOytEGxRC3GKrvZd5cTTUmJz3vrGt
 DhYfHZOHtRJQMqLRJhxEVLM+tnTo5lB3kb1dI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696265304; x=1696870104;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/tGIS2d4IoBhPIJormO2ARUKb4WPqFJw4stm8Ff0wEc=;
 b=u3wtCCcmMAc7fmfsCuOwmYZOSVwTMkauuWKXU/dKDczhROF9vkIGAN5quS6o5KzthJ
 8cu4dK/XbudKAbjx1Zk+UvPKHwr5t0lSxN9Rr1NiKatK1I7827FXbQP3JJhUH3FV+kdm
 A3Db4y2K7lB7xedYTBEUjIa43r9J5ofdn9xomc4oUyKXr46m5gQndo8sGsFoCKpiad92
 BTM/Tg0B8th0mde2hozIkBu27Kotc25WONvvvgP8Zjyljhrp7lu9B98Tr2a7PzC/t9la
 OAGPomUlJgCMplU0m0NP2yHuV1F6qBLKCGrT88jvvSn6gya34AASoSN092sf/xksjSPv
 93HQ==
X-Gm-Message-State: AOJu0YxERU1UF25IO+5zNpdkC8ayjYT/13itCgORS5cfHHbiLPdDmnIK
 /KKNy2iezc/O5bEua+GwJFElat8eyBeKwoWWkFIPYVbq
X-Google-Smtp-Source: AGHT+IHYbcUUVP1V8NWbZ2rlcGoBZHkxiwl6z7Sm1zN5HTa74m32cPr/fcb/9ZAaZqVm1RqqxG1SwQ==
X-Received: by 2002:a17:907:b1a:b0:9ae:699d:8a31 with SMTP id
 h26-20020a1709070b1a00b009ae699d8a31mr173237ejl.33.1696265304730; 
 Mon, 02 Oct 2023 09:48:24 -0700 (PDT)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com.
 [209.85.208.41]) by smtp.gmail.com with ESMTPSA id
 zg22-20020a170907249600b009a5f1d15642sm17287315ejb.158.2023.10.02.09.48.23
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Oct 2023 09:48:24 -0700 (PDT)
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-537f07dfe8eso53a12.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 02 Oct 2023 09:48:23 -0700 (PDT)
X-Received: by 2002:a50:96d1:0:b0:522:4741:d992 with SMTP id
 z17-20020a5096d1000000b005224741d992mr2415eda.4.1696265303058; Mon, 02 Oct
 2023 09:48:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230906160505.2431857-1-dianders@chromium.org>
 <20230906090246.v13.3.I7209db47ef8ec151d3de61f59005bbc59fe8f113@changeid>
 <CAD=FV=UBw1-9=LPUydewyOg8oL2WMG+ZCQ=PBpe0CiCs-ToWSg@mail.gmail.com>
In-Reply-To: <CAD=FV=UBw1-9=LPUydewyOg8oL2WMG+ZCQ=PBpe0CiCs-ToWSg@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 2 Oct 2023 09:48:08 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WCcwc71hSMQVQN4AYi7XhKpOwbOZnt8b9iGUgqmvzuKw@mail.gmail.com>
Message-ID: <CAD=FV=WCcwc71hSMQVQN4AYi7XhKpOwbOZnt8b9iGUgqmvzuKw@mail.gmail.com>
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
 
 Content preview:  Hi, On Mon, Sep 25, 2023 at 5:39 PM Doug Anderson <dianders@chromium.org>
    wrote: > > Mark, > > On Wed, Sep 6, 2023 at 9:06 AM Douglas Anderson <dianders@chromium.org>
    wrote: > > > > +#ifdef CONFIG_ARM [...] 
 
 Content analysis details:   (-0.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.218.53 listed in list.dnswl.org]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
                             [209.85.218.53 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
  0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qnM5x-0008Eq-VK
Subject: Re: [Kgdb-bugreport] [PATCH v13 3/7] arm64: smp: Remove dedicated
 wakeup IPI
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
Cc: Lecopzer Chen <lecopzer.chen@mediatek.com>,
 Peter Zijlstra <peterz@infradead.org>, kgdb-bugreport@lists.sourceforge.net,
 Stephane Eranian <eranian@google.com>, Ard Biesheuvel <ardb@kernel.org>,
 vschneid@redhat.com, "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Chen-Yu Tsai <wens@csie.org>, samitolvanen@google.com,
 Chen-Yu Tsai <wenst@chromium.org>, Masayoshi Mizuma <msys.mizuma@gmail.com>,
 keescook@chromium.org, Stephen Boyd <swboyd@chromium.org>,
 Tomohiro Misono <misono.tomohiro@fujitsu.com>,
 Thomas Gleixner <tglx@linutronix.de>, jpoimboe@kernel.org,
 linux-arm-kernel@lists.infradead.org, scott@os.amperecomputing.com,
 philmd@linaro.org, ito-yuichi@fujitsu.com, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

SGksCgpPbiBNb24sIFNlcCAyNSwgMjAyMyBhdCA1OjM54oCvUE0gRG91ZyBBbmRlcnNvbiA8ZGlh
bmRlcnNAY2hyb21pdW0ub3JnPiB3cm90ZToKPgo+IE1hcmssCj4KPiBPbiBXZWQsIFNlcCA2LCAy
MDIzIGF0IDk6MDbigK9BTSBEb3VnbGFzIEFuZGVyc29uIDxkaWFuZGVyc0BjaHJvbWl1bS5vcmc+
IHdyb3RlOgo+ID4KPiA+ICsjaWZkZWYgQ09ORklHX0FSTTY0X0FDUElfUEFSS0lOR19QUk9UT0NP
TAo+ID4gK3ZvaWQgYXJjaF9zZW5kX3dha2V1cF9pcGkodW5zaWduZWQgaW50IGNwdSkKPiA+ICt7
Cj4gPiArICAgICAgIC8qCj4gPiArICAgICAgICAqIFdlIHVzZSBhIHNjaGVkdWxlciBJUEkgdG8g
d2FrZSB0aGUgQ1BVIGFzIHRoaXMgYXZvaWRzIHRoZSBuZWVkIGZvciBhCj4gPiArICAgICAgICAq
IGRlZGljYXRlZCBJUEkgYW5kIHdlIGNhbiBzYWZlbHkgaGFuZGxlIHNwdXJpb3VzIHNjaGVkdWxl
ciBJUElzLgo+ID4gKyAgICAgICAgKi8KPiA+ICsgICAgICAgYXJjaF9zbXBfc2VuZF9yZXNjaGVk
dWxlKGNwdSk7Cj4KPiBJIHdhcyBiYWNrcG9ydGluZyB0aGlzIHRvIG91ciBDaHJvbWVPUyBrZXJu
ZWxzIGFuZCBvdXIgYnVpbGQgdGVzdCBib3QKPiBub3RpY2VkIHRoYXQgYXJjaF9zbXBfc2VuZF9y
ZXNjaGVkdWxlKCkgZGlkbid0IGV4aXN0IGluIG9sZGVyIGtlcm5lbHMuCj4gVGhhdCdzIGZpbmUt
LUkgY2FuIGFsd2F5cyBhZGp1c3QgdGhpcyBwYXRjaCB3aGVuIGJhY2twb3J0aW5nIG9yCj4gY2hl
cnJ5LXBpY2sgZXh0cmEgcGF0Y2hlcywgYnV0IGl0IG1hZGUgbWUgd29uZGVyLiBJcyB0aGVyZSBh
IHJlYXNvbgo+IHlvdSBjaG9zZSB0byB1c2UgYXJjaF9zbXBfc2VuZF9yZXNjaGVkdWxlKCkgZGly
ZWN0bHkgaGVyZSBpbnN0ZWFkIG9mCj4gc21wX3NlbmRfcmVzY2hlZHVsZSgpPyBJIGd1ZXNzIHRo
ZSBvbmx5IGRpZmZlcmVuY2UgaXMgdGhhdCB5b3UncmUKPiBieXBhc3NpbmcgdGhlIHRyYWNpbmcu
IElzIHRoYXQgb24gcHVycG9zZT8gU2hvdWxkIHdlIGFkZCBhIGNvbW1lbnQKPiBhYm91dCBpdCwg
b3IgY2hhbmdlIHRoaXMgdG8gc21wX3NlbmRfcmVzY2hlZHVsZSgpPwoKRldJVywgSSBwb3N0ZWQg
YSBwYXRjaCBjaGFuZ2luZyB0aGlzIHRvIHNtcF9zZW5kX3Jlc2NoZWR1bGUoKS4gUGxlYXNlCnll
bGwgaWYgdGhpcyBpcyBpbmNvcnJlY3QuCgpodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjMx
MDAyMDk0NTI2LjIuSTJlNmQyMmZjNDJjY2JmNmIyNjQ2NWEyOGExMGUzNmUwNWNjZjMwNzVAY2hh
bmdlaWQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpL
Z2RiLWJ1Z3JlcG9ydCBtYWlsaW5nIGxpc3QKS2dkYi1idWdyZXBvcnRAbGlzdHMuc291cmNlZm9y
Z2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2tnZGIt
YnVncmVwb3J0Cg==
