Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A80771DF9
	for <lists+kgdb-bugreport@lfdr.de>; Mon,  7 Aug 2023 12:27:17 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1qSxSF-0003Ho-KC
	for lists+kgdb-bugreport@lfdr.de;
	Mon, 07 Aug 2023 10:27:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <mark.rutland@arm.com>) id 1qSxSB-0003Hg-TJ
 for kgdb-bugreport@lists.sourceforge.net;
 Mon, 07 Aug 2023 10:27:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KwuNlwA4UwnFmM36MbtkZoeG9AYBBrabnAI2z95mypc=; b=QeXAR4hgCsqpFy8oFdc18h401c
 ZBXXnJFyV6WTf9vBJnUbwTSEFWhiRgRu7cQgg5M4mZlNuLOB+hGHGDl0qr1BtxF8jdKD+Rz6ElV6f
 rEeHh4VI0TPxwqNka+qspmvnKLQXzCvGhSubX4AP/fYy/5cYoTsu0ykleSeiOXfiXylY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KwuNlwA4UwnFmM36MbtkZoeG9AYBBrabnAI2z95mypc=; b=VzjI/6/oUjemGvU0VShSWSDbKd
 8P83FcKlZQQh4qFOEEI+WliX2BWB0im+pgAssbZOHvV8XikCCmu0vMXvbCGEce0rHMpKgH0n7F2mb
 9fnHafp8XqTdEelGSMSnMw9pg8xHGSlwGkWmJqPOEWzGvl9ThdibDNsoh5XmI1SZ1EDI=;
Received: from foss.arm.com ([217.140.110.172])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtp (Exim 4.95)
 id 1qSxSB-00FpNh-4e for kgdb-bugreport@lists.sourceforge.net;
 Mon, 07 Aug 2023 10:27:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B02331FB;
 Mon,  7 Aug 2023 03:27:48 -0700 (PDT)
Received: from FVFF77S0Q05N.cambridge.arm.com (FVFF77S0Q05N.cambridge.arm.com
 [10.1.32.139])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 01C8E3F59C;
 Mon,  7 Aug 2023 03:27:02 -0700 (PDT)
Date: Mon, 7 Aug 2023 11:27:00 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Douglas Anderson <dianders@chromium.org>
Message-ID: <ZNDG9AIdH443Z4BX@FVFF77S0Q05N.cambridge.arm.com>
References: <20230601213440.2488667-1-dianders@chromium.org>
 <20230601143109.v9.6.Ia3aeac89bb6751b682237e76e5ba594318e4b1aa@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230601143109.v9.6.Ia3aeac89bb6751b682237e76e5ba594318e4b1aa@changeid>
X-Spam-Score: -2.3 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Jun 01, 2023 at 02:31:50PM -0700, Douglas Anderson
 wrote: > To save architectures from needing to wrap the call in #ifdefs,
 add a > stub no-op version of kgdb_nmicallback(), which returns 1 if [...]
 Content analysis details:   (-2.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [217.140.110.172 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1qSxSB-00FpNh-4e
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

On Thu, Jun 01, 2023 at 02:31:50PM -0700, Douglas Anderson wrote:
> To save architectures from needing to wrap the call in #ifdefs, add a
> stub no-op version of kgdb_nmicallback(), which returns 1 if it didn't
> handle anything.
> 
> Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> In v9 this is the only kgdb dependency. I'm assuming it could go
> through the arm64 tree? If that's not a good idea, we could always
> change the patch ("arm64: kgdb: Roundup cpus using IPI as NMI") not to
> depend on it by only calling kgdb_nmicallback() if CONFIG_KGDB is not
> defined.
> 
> Changes in v9:
> - Added missing "inline"
> 
> Changes in v8:
> - "Provide a stub kgdb_nmicallback() if !CONFIG_KGDB" new for v8
> 
>  include/linux/kgdb.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/include/linux/kgdb.h b/include/linux/kgdb.h
> index 258cdde8d356..76e891ee9e37 100644
> --- a/include/linux/kgdb.h
> +++ b/include/linux/kgdb.h
> @@ -365,5 +365,6 @@ extern void kgdb_free_init_mem(void);
>  #define dbg_late_init()
>  static inline void kgdb_panic(const char *msg) {}
>  static inline void kgdb_free_init_mem(void) { }
> +static inline int kgdb_nmicallback(int cpu, void *regs) { return 1; }

Is '1' an error?

Can we return an actual error code if so? It makes it *much* clearer to anyone
looking at the code.

Thanks,
Mark.

>  #endif /* ! CONFIG_KGDB */
>  #endif /* _KGDB_H_ */
> -- 
> 2.41.0.rc2.161.g9c6817b8e7-goog
> 


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
