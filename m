Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 99CAF7AE302
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 26 Sep 2023 02:40:02 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1qkw7O-0001V5-RW
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 26 Sep 2023 00:40:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1qkw7L-0001Ux-Q9
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 26 Sep 2023 00:39:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZnEgEKAhGM5JWN8y/Tiqur2/djSzZqgbL2OPyciIbQ0=; b=VHSSvir1bflUSymRAodl3abqXk
 X8dTFlCrx92CRsyWgZqSS3L+s1XWhIPAv1IDFHUhNTvoU2Tw8pRbByzAhmMdtIE22T07+RVs/QlQl
 CH9Y45JW/U3JyDhf69UZfmvtMtHGhyzjGyz0xy2+wwvpG35o/4qyBzssIXAwQwPjhVLk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZnEgEKAhGM5JWN8y/Tiqur2/djSzZqgbL2OPyciIbQ0=; b=ij+ujl5miPJqLY8lfEOHTI0ZKx
 /CsyJl9l6pov02usCiw+uKuLs6mb8KOlyoOUMNQKHT9jandsBw7jjmwhsQhztX2wkqaqeyi3EmGdv
 /eeOTUaCuv+tYwdhkSADjv5wn6Lx5C1lZcwdcNkiJRrQxzAXprhYFl1NirLFv+X1B3zY=;
Received: from mail-wr1-f52.google.com ([209.85.221.52])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qkw7G-006YAT-IJ for kgdb-bugreport@lists.sourceforge.net;
 Tue, 26 Sep 2023 00:39:58 +0000
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-32172f8a5dbso6426946f8f.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 25 Sep 2023 17:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1695688786; x=1696293586;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZnEgEKAhGM5JWN8y/Tiqur2/djSzZqgbL2OPyciIbQ0=;
 b=UXcVi6gGRzHptbts03ClwVIDOajE4EDRFvEnxrBrpdwG5u0ofiboo9VBQUKBwVhEnz
 SwwslOCAZBGX3LnxBeySEHlpvyLZdN6hPbJ3ovNaiJCVW/OFHmPLfq1rbgudFpJ6YB9t
 vbQaqfDpbeBugOWvaP4n2+Ma9bB+pbx2m1Lt0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695688786; x=1696293586;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZnEgEKAhGM5JWN8y/Tiqur2/djSzZqgbL2OPyciIbQ0=;
 b=AlVDZJUt+r2jl6lctAcosNEol3EXrD5M4BKeZ6d2StqwwwMKwTDWKH+1Uo+2ZftVwb
 6SObxUmg4hNo7ulHWvSVUfqVxFSwWdeBvtmuDl8CCw39URjAfqUoJ7p6w1pSpAs7RsXb
 7DhirBikUnZn01O6uxzI7DKm5wam5YSPh1w8n5dLaHUL6B8N7NVIA06aGUjLHsRPUkGG
 FgS+1zjpqJsVsIUSZFcPO8RCvln+pF/Mopanou4z4aePuc2Ay8TVjXDUABfe1JXUjd7/
 OkuA0JSbbWYyfIHPcnDq69QNyqpPHwJbUbQJA1OuSxVlesJMPU9/sDrkb/WrC9uRjUnp
 O0UA==
X-Gm-Message-State: AOJu0Yy7+Dr7v5ioSCPSIevFK4AoEUzluyjwcr5WXv4NOBuwwa6EE+Ju
 AfLki7W0yHahoTH/YjwW4GXvOiTyKfbxN30XsOD9NAzo
X-Google-Smtp-Source: AGHT+IH7iJZSsufzC9Nz5t0HAOpSDXbEzmMOqz7FDLVhvpcKiAMQjNa9gCTjrOpHWL/8tPEbb50sKA==
X-Received: by 2002:adf:f1c9:0:b0:31f:9398:3654 with SMTP id
 z9-20020adff1c9000000b0031f93983654mr7014460wro.40.1695688786362; 
 Mon, 25 Sep 2023 17:39:46 -0700 (PDT)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com.
 [209.85.128.44]) by smtp.gmail.com with ESMTPSA id
 rv7-20020a17090710c700b009adc81bb544sm6971462ejb.106.2023.09.25.17.39.45
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Sep 2023 17:39:45 -0700 (PDT)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-4063c2ed5ebso2295e9.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 25 Sep 2023 17:39:45 -0700 (PDT)
X-Received: by 2002:a05:600c:3b90:b0:405:35bf:7362 with SMTP id
 n16-20020a05600c3b9000b0040535bf7362mr54102wms.0.1695688785170; Mon, 25 Sep
 2023 17:39:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230906160505.2431857-1-dianders@chromium.org>
 <20230906090246.v13.3.I7209db47ef8ec151d3de61f59005bbc59fe8f113@changeid>
In-Reply-To: <20230906090246.v13.3.I7209db47ef8ec151d3de61f59005bbc59fe8f113@changeid>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 25 Sep 2023 17:39:32 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UBw1-9=LPUydewyOg8oL2WMG+ZCQ=PBpe0CiCs-ToWSg@mail.gmail.com>
Message-ID: <CAD=FV=UBw1-9=LPUydewyOg8oL2WMG+ZCQ=PBpe0CiCs-ToWSg@mail.gmail.com>
To: Mark Rutland <mark.rutland@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Sumit Garg <sumit.garg@linaro.org>, 
 Daniel Thompson <daniel.thompson@linaro.org>, Marc Zyngier <maz@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Mark, On Wed, Sep 6, 2023 at 9:06 AM Douglas Anderson <dianders@chromium.org>
    wrote: > > +#ifdef CONFIG_ARM64_ACPI_PARKING_PROTOCOL > +void arch_send_wakeup_ipi(unsigned
    int cpu) > +{ > + /* > + * We use [...] 
 
 Content analysis details:   (-0.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.221.52 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.221.52 listed in list.dnswl.org]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qkw7G-006YAT-IJ
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

TWFyaywKCk9uIFdlZCwgU2VwIDYsIDIwMjMgYXQgOTowNuKAr0FNIERvdWdsYXMgQW5kZXJzb24g
PGRpYW5kZXJzQGNocm9taXVtLm9yZz4gd3JvdGU6Cj4KPiArI2lmZGVmIENPTkZJR19BUk02NF9B
Q1BJX1BBUktJTkdfUFJPVE9DT0wKPiArdm9pZCBhcmNoX3NlbmRfd2FrZXVwX2lwaSh1bnNpZ25l
ZCBpbnQgY3B1KQo+ICt7Cj4gKyAgICAgICAvKgo+ICsgICAgICAgICogV2UgdXNlIGEgc2NoZWR1
bGVyIElQSSB0byB3YWtlIHRoZSBDUFUgYXMgdGhpcyBhdm9pZHMgdGhlIG5lZWQgZm9yIGEKPiAr
ICAgICAgICAqIGRlZGljYXRlZCBJUEkgYW5kIHdlIGNhbiBzYWZlbHkgaGFuZGxlIHNwdXJpb3Vz
IHNjaGVkdWxlciBJUElzLgo+ICsgICAgICAgICovCj4gKyAgICAgICBhcmNoX3NtcF9zZW5kX3Jl
c2NoZWR1bGUoY3B1KTsKCkkgd2FzIGJhY2twb3J0aW5nIHRoaXMgdG8gb3VyIENocm9tZU9TIGtl
cm5lbHMgYW5kIG91ciBidWlsZCB0ZXN0IGJvdApub3RpY2VkIHRoYXQgYXJjaF9zbXBfc2VuZF9y
ZXNjaGVkdWxlKCkgZGlkbid0IGV4aXN0IGluIG9sZGVyIGtlcm5lbHMuClRoYXQncyBmaW5lLS1J
IGNhbiBhbHdheXMgYWRqdXN0IHRoaXMgcGF0Y2ggd2hlbiBiYWNrcG9ydGluZyBvcgpjaGVycnkt
cGljayBleHRyYSBwYXRjaGVzLCBidXQgaXQgbWFkZSBtZSB3b25kZXIuIElzIHRoZXJlIGEgcmVh
c29uCnlvdSBjaG9zZSB0byB1c2UgYXJjaF9zbXBfc2VuZF9yZXNjaGVkdWxlKCkgZGlyZWN0bHkg
aGVyZSBpbnN0ZWFkIG9mCnNtcF9zZW5kX3Jlc2NoZWR1bGUoKT8gSSBndWVzcyB0aGUgb25seSBk
aWZmZXJlbmNlIGlzIHRoYXQgeW91J3JlCmJ5cGFzc2luZyB0aGUgdHJhY2luZy4gSXMgdGhhdCBv
biBwdXJwb3NlPyBTaG91bGQgd2UgYWRkIGEgY29tbWVudAphYm91dCBpdCwgb3IgY2hhbmdlIHRo
aXMgdG8gc21wX3NlbmRfcmVzY2hlZHVsZSgpPwoKVGhhbmtzIQoKLURvdWcKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpLZ2RiLWJ1Z3JlcG9ydCBtYWls
aW5nIGxpc3QKS2dkYi1idWdyZXBvcnRAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlz
dHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2tnZGItYnVncmVwb3J0Cg==
