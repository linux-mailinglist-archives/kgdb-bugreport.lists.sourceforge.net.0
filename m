Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CB5579454B
	for <lists+kgdb-bugreport@lfdr.de>; Wed,  6 Sep 2023 23:46:09 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1qe0Lf-00020R-6X
	for lists+kgdb-bugreport@lfdr.de;
	Wed, 06 Sep 2023 21:46:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <swboyd@chromium.org>) id 1qe0Le-00020K-Eq
 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 06 Sep 2023 21:46:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 References:In-Reply-To:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=96tt7mjy0zwf48H2OXBzxLiMPsP9ITEZSEJu0hJniYk=; b=Z61ZlluCO/tv6MzolyVkMRyYUh
 GdI29m3U2iI3TNFTr9kUxC/shaMF2WNs2rURCp3EHH5KOGlBFa5EFeBxMz84L0UEdZsqp+8e/dUs6
 IZVyZxtaSpUoz3vxnrMtXl4WxX6g+mdCofSGdOMyH7V0bc021BQMG3x04S2u/d2RNFeI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:References:In-Reply-To:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=96tt7mjy0zwf48H2OXBzxLiMPsP9ITEZSEJu0hJniYk=; b=I2i5pVwQDzPJIywdXnFDDN/AhE
 I4bBUFdlNChIFIHHyFlL23CDJkB9kVfTB3Q+SMXixEycyuUTC7ac/Gvgr/d8qfhiMjyPuCS3tvObc
 wIoMFb49pSa6lVUvHt0j1s3MP28Qnocj1cqNqP7dJhHFrz8XAVXGUulvrB4upsfr62a0=;
Received: from mail-lf1-f52.google.com ([209.85.167.52])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qe0La-0004J4-Mc for kgdb-bugreport@lists.sourceforge.net;
 Wed, 06 Sep 2023 21:46:07 +0000
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-501cba1ec0aso374780e87.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 06 Sep 2023 14:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1694036756; x=1694641556;
 darn=lists.sourceforge.net; 
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=96tt7mjy0zwf48H2OXBzxLiMPsP9ITEZSEJu0hJniYk=;
 b=OwiLDsnGTkqvM3xZtn6PsFuXdKl0n76Ys6A87BMvdMiBI4GhOIfzIlwUsYQRm16ZzQ
 Nv7QDPNSAl9ePBc4Sf3OgToEGhCHZx7V8JNTz3T2MQpXfQtm3tNUl7pHx7TxA6ayzrSA
 jB6th3sm7Xdb0O8UTu1HKTWSb/GhMljZ4idOg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1694036756; x=1694641556;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=96tt7mjy0zwf48H2OXBzxLiMPsP9ITEZSEJu0hJniYk=;
 b=jNZQe8bVTLySznkWBKYSeHJxx2wcSgPonI3Afvh//PDkZiwZjNano6+eTclAMxf4WH
 FL1PPY24wyPWF0sC8QzB9uV6f4CDeaiV5XCnrQf8bBeaKJNoCvBtyshS99lxJCV6K6K6
 QQQAD50uQDPNqnjcXjtzzuroSKhzrD+5uk3W9uMw7is4BgD+eGkkiSvWEvwZEer2rrRk
 O6sdueonDITgiSmLIlfSQ+cwEDxzxgP/zS936SdTaIfYT/wpm4L4NXfVt3xgttSN/8MZ
 +ntgs9GhrkfxhEGgXaWLb6CMQIMzRElitD2A2eQO/0BRX6uJxxHLa6EE4n1JrhExOZxw
 Hz3w==
X-Gm-Message-State: AOJu0YyYxTY+243ffcfNT1dP0iaSd99nQT7ZBy/FKk6Tv+PfwR2AtQox
 LJ0ffQ8fc8uyXk7CBrfwv8/jPXWR5pyrEgl8cv1PGw==
X-Google-Smtp-Source: AGHT+IEYoUZI7EWDiVFAQU39A6TrMXW8B5b18tDscF/EUhrbaZ1WRb+HiEMWcNMeUUEWh0eVYCDRP1QX9A6MMJC7hB8=
X-Received: by 2002:a05:6512:2820:b0:4fd:c84f:30d4 with SMTP id
 cf32-20020a056512282000b004fdc84f30d4mr3797056lfb.36.1694036756018; Wed, 06
 Sep 2023 14:45:56 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 6 Sep 2023 16:45:55 -0500
MIME-Version: 1.0
In-Reply-To: <20230906090246.v13.7.I625d393afd71e1766ef73d3bfaac0b347a4afd19@changeid>
References: <20230906160505.2431857-1-dianders@chromium.org>
 <20230906090246.v13.7.I625d393afd71e1766ef73d3bfaac0b347a4afd19@changeid>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 6 Sep 2023 16:45:55 -0500
Message-ID: <CAE-0n52v7kcfiX3=4PKUPJpiCm4rmSr8xpKnaD+Q4-BS9t_prg@mail.gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
 Daniel Thompson <daniel.thompson@linaro.org>, 
 Douglas Anderson <dianders@chromium.org>, Marc Zyngier <maz@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Sumit Garg <sumit.garg@linaro.org>, 
 Will Deacon <will@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Quoting Douglas Anderson (2023-09-06 09:03:02) > Mark the
 three IPI-related globals in smp.c as "__ro_after_init" since > they are only
 ever set in set_smp_ipi_range(), which is marked > "__init". Thi [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.167.52 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.52 listed in wl.mailspike.net]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qe0La-0004J4-Mc
Subject: Re: [Kgdb-bugreport] [PATCH v13 7/7] arm64: smp: Mark IPI globals
 as __ro_after_init
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
Cc: vschneid@redhat.com, ito-yuichi@fujitsu.com, scott@os.amperecomputing.com,
 Lecopzer Chen <lecopzer.chen@mediatek.com>,
 Peter Zijlstra <peterz@infradead.org>, kgdb-bugreport@lists.sourceforge.net,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 linux-kernel@vger.kernel.org, Stephane Eranian <eranian@google.com>,
 jpoimboe@kernel.org, linux-perf-users@vger.kernel.org,
 Chen-Yu Tsai <wens@csie.org>, Chen-Yu Tsai <wenst@chromium.org>,
 Tomohiro Misono <misono.tomohiro@fujitsu.com>,
 Thomas Gleixner <tglx@linutronix.de>, Masayoshi Mizuma <msys.mizuma@gmail.com>,
 Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Quoting Douglas Anderson (2023-09-06 09:03:02)
> Mark the three IPI-related globals in smp.c as "__ro_after_init" since
> they are only ever set in set_smp_ipi_range(), which is marked
> "__init". This is a better and more secure marking than the old
> "__read_mostly".
>
> Suggested-by: Stephen Boyd <swboyd@chromium.org>
> Acked-by: Mark Rutland <mark.rutland@arm.com>
> Tested-by: Chen-Yu Tsai <wenst@chromium.org>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
