Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D0BEB7739E7
	for <lists+kgdb-bugreport@lfdr.de>; Tue,  8 Aug 2023 13:25:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1qTKqB-0007Lo-Ga
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 08 Aug 2023 11:25:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daniel.thompson@linaro.org>) id 1qTKq8-0007Lh-Lg
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 08 Aug 2023 11:25:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uf6Qwp5IcBfnw8cvFBZLBD+6OL+Kh6Nn1R+GOEG85Xs=; b=HHmfcAfMHZGsw1ZkgkeqDyP5Eh
 QjDQkOqYljSvgq2hQYCulSjmbcyT0g7s6cUsyeKs05RI43qJhVXsNZTsoj3s+kZmmGZcFeYmtHB/g
 9p4qlmvLAL+EnygOKxv5baUOzrkjhgLNIKw38bvtcPrUiGcJhn9KcHzU7Ua9uCGhTDxQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=uf6Qwp5IcBfnw8cvFBZLBD+6OL+Kh6Nn1R+GOEG85Xs=; b=R675Gu+VXNtB316BAFFXIUME8f
 WIHt2JtVCSpl5N+va1/zZPjqFjQY9HMUncD3JzLDZziQyoianz0K4jTR4rIR4pJa+I5sdpxAnbKYp
 QsDlZJDXSjgK9qZdfwVovD/EpQbZvKTa7wBFr0StcGhRTTViNAIGdLtJz2byJxVDqnj0=;
Received: from mail-wm1-f52.google.com ([209.85.128.52])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qTKq0-000615-Ly for kgdb-bugreport@lists.sourceforge.net;
 Tue, 08 Aug 2023 11:25:28 +0000
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-3fe5c0e57d2so16269535e9.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 08 Aug 2023 04:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691493914; x=1692098714;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=uf6Qwp5IcBfnw8cvFBZLBD+6OL+Kh6Nn1R+GOEG85Xs=;
 b=evIxpubdS6vYoKh44mAXNmZCKejlM6/AL6zZ9FcZ5m4Aw2aq3cBqyAN49/dKH79wkw
 3xBkudRfvsc9hC1tTwaUZM+9Q+pmJwJHpkDmIE/CkcKmN45ZRpRzXw1pWK1mgDCQBKx/
 6urrv9KXHZROTa4MKnqSthcbrpBUDwckAeh4+8YmWJoKeikcsjCOri4ezS4+sEbXnAAo
 Yd2KwWjNHVAX8Y3mvTvDAPanR1/TE5LjKd86kJmR7zuqQWrD7aqaZnonkC9Kc+AYw0jv
 BZpJq82UGmB7rUi9ifNsmz3x3NRzpXSYI8/8BezuFSMTgQ99e6okrQrd8ArNXDthVfCl
 GEyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691493914; x=1692098714;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uf6Qwp5IcBfnw8cvFBZLBD+6OL+Kh6Nn1R+GOEG85Xs=;
 b=Dg89D1fv7g4YFttyVobBfS5t9O7PifkoL9CrAHsE9ng66ex7LG93quuyw9bpoVgmEa
 UQjHUsQDP0cTwGFSIN+4jpUWosOu6XiS+DcpVWWV9WnEZjsDNQ+c96eQVAN7lcQLIRUd
 Wje4onT22dIJwjzk51mEgo18fCyvRAcliLxWn3LJLX0+7XJAP6XLj1Fqe8+qHDprGI8m
 qUZZLgdhXdHUU8cmZb/abhoROPuwRiUFVTw5nOoKtw5yeW1rbk8Ro5MXovApjViyUbKO
 KigGbyL+dgdpg7ZzJMnq6ji4+402I5XMqdcas69JpzVGplWzSfTTx55Bjqrd2Xe8xNmQ
 vtUA==
X-Gm-Message-State: AOJu0YwoePB06OgWZ1SWehjB3EgcfiybBQwPypihTok1nl42EQs82u7j
 E/DhYT3naFULIAje68p5Hsd+rLuYFLcChtF1+XFMYQ==
X-Google-Smtp-Source: AGHT+IEoY3AsYBoeqi4l/r6UwxzB9eht2nw5J7VW0R/XG0aViKCtpjVte+QLSioXOu6hnHCUhQPKuQ==
X-Received: by 2002:a2e:3004:0:b0:2b4:6d59:7863 with SMTP id
 w4-20020a2e3004000000b002b46d597863mr8284441ljw.25.1691493425593; 
 Tue, 08 Aug 2023 04:17:05 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 q7-20020a1cf307000000b003fa98908014sm17836323wmq.8.2023.08.08.04.17.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Aug 2023 04:17:05 -0700 (PDT)
Date: Tue, 8 Aug 2023 12:17:03 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Mark Rutland <mark.rutland@arm.com>
Message-ID: <20230808111703.GB411689@aspen.lan>
References: <20230601213440.2488667-1-dianders@chromium.org>
 <20230601143109.v9.7.I2ef26d1b3bfbed2d10a281942b0da7d9854de05e@changeid>
 <ZNDHZLGds0DTN6zg@FVFF77S0Q05N.cambridge.arm.com>
 <20230807152444.GA375529@aspen.lan>
 <ZNEV_mz4VU1HyBc9@FVFF77S0Q05N.cambridge.arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZNEV_mz4VU1HyBc9@FVFF77S0Q05N.cambridge.arm.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Aug 07, 2023 at 05:04:14PM +0100, Mark Rutland wrote:
 > On Mon, Aug 07, 2023 at 04:24:44PM +0100, Daniel Thompson wrote: > > On
 Mon, Aug 07, 2023 at 11:28:52AM +0100, Mark Rutland wrote: > > > [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.52 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.128.52 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1qTKq0-000615-Ly
Subject: Re: [Kgdb-bugreport] [PATCH v9 7/7] arm64: kgdb: Roundup cpus using
 the debug IPI
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
 linux-kernel@vger.kernel.org, Lecopzer Chen <lecopzer.chen@mediatek.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>, ito-yuichi@fujitsu.com,
 Stephen Boyd <swboyd@chromium.org>, linux-perf-users@vger.kernel.org,
 Chen-Yu Tsai <wens@csie.org>, Marc Zyngier <maz@kernel.org>,
 kgdb-bugreport@lists.sourceforge.net, Thomas Gleixner <tglx@linutronix.de>,
 Masayoshi Mizuma <msys.mizuma@gmail.com>, Will Deacon <will@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Wei Li <liwei391@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Mon, Aug 07, 2023 at 05:04:14PM +0100, Mark Rutland wrote:
> On Mon, Aug 07, 2023 at 04:24:44PM +0100, Daniel Thompson wrote:
> > On Mon, Aug 07, 2023 at 11:28:52AM +0100, Mark Rutland wrote:
> > > On Thu, Jun 01, 2023 at 02:31:51PM -0700, Douglas Anderson wrote:
> > > > From: Sumit Garg <sumit.garg@linaro.org>
> > > >
> > > > Let's use the debug IPI for rounding up CPUs in kgdb. When the debug
> > > > IPI is backed by an NMI (or pseudo NMI) then this will let us debug
> > > > even hard locked CPUs. When the debug IPI isn't backed by an NMI then
> > > > this won't really have any huge benefit but it will still work.
> > > >
> > > > Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> > > > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > > > ---
> > > >
> > > > Changes in v9:
> > > > - Remove fallback for when debug IPI isn't available.
> > > > - Renamed "NMI IPI" to "debug IPI" since it might not be backed by NMI.
> > > >
> > > >  arch/arm64/kernel/ipi_debug.c |  5 +++++
> > > >  arch/arm64/kernel/kgdb.c      | 14 ++++++++++++++
> > > >  2 files changed, 19 insertions(+)
> > >
> > > This looks fine to me, but I'd feel a bit happier if we had separate SGIs for
> > > the backtrace and the KGDB callback as they're logically unrelated.
> >
> > I've no objections to seperate SGIs (if one can be found) but I'm curious
> > what benefit emerges from giving them seperate IPIs.
>
> Mostly an "I'd feel happier"; they're logically unrelated and having them
> separate avoids the risk of them unintentionally getting in the way of the
> other.
>
> > Both interfaces are already designed to share and NMI-like IPI nicely
> > (and IIUC they must share one on x86), neither is performance
> > critical[1] and the content of /proc/interrupts for the IPI is seldom
> > going to be of much interest.
>
> Sure; I understand that. The flip side of "neither is performance critical" is
> that they're seldom tested in terms of interaction with one another, and hence
> for robustness I'd prefer they're separate.

We can't really stop them interacting when kdb is enabled: both activate
special logic to intercept console messages and this is much more
complex than the "is this my IPI?" tests.


> I agree it's not strictly necessary, but given we can easily free up an SGI
> slot, I think it'd be worthwhile. We can always decide to fold them together in
> future if we have to.

Agreed.

It should be very little bother to "reclaim" an IPI from the diagnostics
machinery if that is ever needed. So seperate IPIs is no problem from my
point of view.


Daniel.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
