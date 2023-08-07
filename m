Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC22771E16
	for <lists+kgdb-bugreport@lfdr.de>; Mon,  7 Aug 2023 12:30:11 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1qSxV4-000701-Jl
	for lists+kgdb-bugreport@lfdr.de;
	Mon, 07 Aug 2023 10:30:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <mark.rutland@arm.com>) id 1qSxV2-0006zu-Qp
 for kgdb-bugreport@lists.sourceforge.net;
 Mon, 07 Aug 2023 10:30:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4nPSgyBgZjdImbzBEx2EzeN5KeQcKZpKCYyeQXlqduk=; b=dNgN4ewtnb7Jr6CDYGIxX9wTHN
 6aexlJt44Vibauy+qf87rK2cvInbVzOmbsmX2LhgQc4onwrLQp3SwmlEsQwvPOraLaZw6MRTmfaja
 +mp2lGgpivMaX6bI1bDTFP9AOASXD+8qdxMxKQck5dHeUlziAU3i4qpUOayxwMezigSQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4nPSgyBgZjdImbzBEx2EzeN5KeQcKZpKCYyeQXlqduk=; b=dcpCZxsR/Ll2Sy5V8k/Eim7D3w
 5KYYKNwhL3QaCDbJ5C8sTYDvTEUopQdaqfEo9GgaD8X+gON0njPESpHqXaCpLNXVG7fI1T5DGPhjy
 /ekaFtlAarKFutrKvG0NuB2nIZIg28wbKLLOK05hYREzRkfH4k97+7Kk+Z/98XzBTIHo=;
Received: from foss.arm.com ([217.140.110.172])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtp (Exim 4.95)
 id 1qSxV0-00FpWc-Tx for kgdb-bugreport@lists.sourceforge.net;
 Mon, 07 Aug 2023 10:30:07 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 996E91FB;
 Mon,  7 Aug 2023 03:30:44 -0700 (PDT)
Received: from FVFF77S0Q05N.cambridge.arm.com (FVFF77S0Q05N.cambridge.arm.com
 [10.1.32.139])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CD54B3F59C;
 Mon,  7 Aug 2023 03:29:58 -0700 (PDT)
Date: Mon, 7 Aug 2023 11:29:56 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Douglas Anderson <dianders@chromium.org>
Message-ID: <ZNDHpMuF5-A7xcyr@FVFF77S0Q05N.cambridge.arm.com>
References: <20230601213440.2488667-1-dianders@chromium.org>
 <20230601143109.v9.6.Ia3aeac89bb6751b682237e76e5ba594318e4b1aa@changeid>
 <ZNDG9AIdH443Z4BX@FVFF77S0Q05N.cambridge.arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZNDG9AIdH443Z4BX@FVFF77S0Q05N.cambridge.arm.com>
X-Spam-Score: -2.3 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Aug 07, 2023 at 11:27:00AM +0100, Mark Rutland wrote:
 > On Thu, Jun 01, 2023 at 02:31:50PM -0700, Douglas Anderson wrote: > > +static
 inline int kgdb_nmicallback(int cpu, void *regs) { return [...] 
 Content analysis details:   (-2.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [217.140.110.172 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1qSxV0-00FpWc-Tx
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Mon, Aug 07, 2023 at 11:27:00AM +0100, Mark Rutland wrote:
> On Thu, Jun 01, 2023 at 02:31:50PM -0700, Douglas Anderson wrote:
> > +static inline int kgdb_nmicallback(int cpu, void *regs) { return 1; }
> 
> Is '1' an error?
> 
> Can we return an actual error code if so? It makes it *much* clearer to anyone
> looking at the code.

Never mind; I see this was already queued. Sorry for the noise.

Thanks,
Mark.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
