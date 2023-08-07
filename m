Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 78C3A771EAE
	for <lists+kgdb-bugreport@lfdr.de>; Mon,  7 Aug 2023 12:47:19 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1qSxld-0003Vk-Sj
	for lists+kgdb-bugreport@lfdr.de;
	Mon, 07 Aug 2023 10:47:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <maz@kernel.org>) id 1qSxlc-0003Ve-O1
 for kgdb-bugreport@lists.sourceforge.net;
 Mon, 07 Aug 2023 10:47:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Message-ID:
 References:In-Reply-To:Subject:Cc:To:From:Date:MIME-Version:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bkh9W+9oFz1h89zfc80Gdiveqp+Ndsij2w5D5I3C600=; b=PoUrl2iXQcns8ELlIikAWyQ7WM
 CbGeeScd/tkRdMRr6LwKTf1uxe127nNeEqLH/jrFqWiZek4dkOJNxmBdFJrkwiGgICK2ozokYsniA
 Rpw24zpRUkX7hMARf3VroOXyXXHFuAp1mTZ+IMSaRPdcEACJP93oXWHLbzAEWYzVyab0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Message-ID:References:In-Reply-To:
 Subject:Cc:To:From:Date:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bkh9W+9oFz1h89zfc80Gdiveqp+Ndsij2w5D5I3C600=; b=Nh/FGZofbGe/u7/Z0/OIgibt26
 y3d4OZ9NdbEB86YMD2MpBwl+8A7po9lkhGfQaQi/WS1IRWTF4MmZ5a4bRBtzkwdXxqFF/128sCWET
 NLw4ikSNO6v8ksOBeTN6yuLOWzCXla9YdIUymPZOLT20NkVQwbNZOZpWJPIlIL9kj4gQ=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qSxlc-00FqKk-HH for kgdb-bugreport@lists.sourceforge.net;
 Mon, 07 Aug 2023 10:47:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9AA0661697;
 Mon,  7 Aug 2023 10:47:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3C07C433C7;
 Mon,  7 Aug 2023 10:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1691405227;
 bh=UAackwL7UM7HgpYl/6xaBi50e0epZnNRDwJYOlZupq4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=XTR4HktOiAPHWP3h5fhk2wD4UGXcszx/1wmiz0cTUw4hgJdMG/oBFXfBL5g8PRXDm
 yLyTKTnw9g7BoWrTvMncRJn8LkXHzRuxipnZVjx0vFvcXrqT4eR86TG5LTl5tNbObo
 xJQ/FGp3frhFh6/f8dqgOoKdt8ON2EbmmdwfHh1i08coEHUQBuFyz/x83TcE1yqtjt
 7TqWEYZDHjUKH3kW5qO6/n6uSTXpZqFvYnjjmhqi5LD4LAJSCsEkKcRIcR2CCWQAgo
 Gs1ws/3JxfY+LKKLeFt9C8F81JN/6L0Q0raPKMl4v1iHyjfJxQnAsOOrha9B/6u7Tz
 9Y1H3yabnBsiw==
Received: from disco-boy.misterjones.org ([217.182.43.188] helo=www.loen.fr)
 by disco-boy.misterjones.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <maz@kernel.org>) id 1qSxlQ-002nFK-Gz;
 Mon, 07 Aug 2023 11:47:04 +0100
MIME-Version: 1.0
Date: Mon, 07 Aug 2023 11:47:04 +0100
From: Marc Zyngier <maz@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
In-Reply-To: <ZNDHZLGds0DTN6zg@FVFF77S0Q05N.cambridge.arm.com>
References: <20230601213440.2488667-1-dianders@chromium.org>
 <20230601143109.v9.7.I2ef26d1b3bfbed2d10a281942b0da7d9854de05e@changeid>
 <ZNDHZLGds0DTN6zg@FVFF77S0Q05N.cambridge.arm.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <a030019c7c5887d54b97054ed7d9af12@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 217.182.43.188
X-SA-Exim-Rcpt-To: mark.rutland@arm.com, dianders@chromium.org,
 catalin.marinas@arm.com, will@kernel.org, sumit.garg@linaro.org,
 daniel.thompson@linaro.org, linux-perf-users@vger.kernel.org,
 ito-yuichi@fujitsu.com, wens@csie.org, ardb@kernel.org, swboyd@chromium.org,
 peterz@infradead.org, tglx@linutronix.de, linux-arm-kernel@lists.infradead.org,
 kgdb-bugreport@lists.sourceforge.net, msys.mizuma@gmail.com,
 rafael.j.wysocki@intel.com, lecopzer.chen@mediatek.com, liwei391@huawei.com,
 linux-kernel@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023-08-07 11:28, Mark Rutland wrote: > On Thu, Jun 01,
 2023 at 02:31:51PM -0700,
 Douglas Anderson wrote: >> From: Sumit Garg <sumit.garg@linaro.org>
 >> >> Let's use the debug IPI for rounding up C [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qSxlc-00FqKk-HH
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 linux-kernel@vger.kernel.org, Lecopzer Chen <lecopzer.chen@mediatek.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>, ito-yuichi@fujitsu.com,
 Stephen Boyd <swboyd@chromium.org>, linux-perf-users@vger.kernel.org,
 Chen-Yu Tsai <wens@csie.org>, kgdb-bugreport@lists.sourceforge.net,
 Thomas Gleixner <tglx@linutronix.de>, Masayoshi Mizuma <msys.mizuma@gmail.com>,
 Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Wei Li <liwei391@huawei.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On 2023-08-07 11:28, Mark Rutland wrote:
> On Thu, Jun 01, 2023 at 02:31:51PM -0700, Douglas Anderson wrote:
>> From: Sumit Garg <sumit.garg@linaro.org>
>> 
>> Let's use the debug IPI for rounding up CPUs in kgdb. When the debug
>> IPI is backed by an NMI (or pseudo NMI) then this will let us debug
>> even hard locked CPUs. When the debug IPI isn't backed by an NMI then
>> this won't really have any huge benefit but it will still work.
>> 
>> Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
>> Signed-off-by: Douglas Anderson <dianders@chromium.org>
>> ---
>> 
>> Changes in v9:
>> - Remove fallback for when debug IPI isn't available.
>> - Renamed "NMI IPI" to "debug IPI" since it might not be backed by 
>> NMI.
>> 
>>  arch/arm64/kernel/ipi_debug.c |  5 +++++
>>  arch/arm64/kernel/kgdb.c      | 14 ++++++++++++++
>>  2 files changed, 19 insertions(+)
> 
> This looks fine to me, but I'd feel a bit happier if we had separate 
> SGIs for
> the backtrace and the KGDB callback as they're logically unrelated.

Well, we're a bit stuck here.

We have exactly *one* spare SGI with GICv3, as we lose 8 of them
to the secure side. One possibility would be to mux some of the
lesser used IPIs onto two SGIs (one with standard priority, and
one with NMI priority).

         M.
-- 
Jazz is not dead. It just smells funny...


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
