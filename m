Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E469AC229
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 23 Oct 2024 10:50:01 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1t3X44-0003FR-Nc
	for lists+kgdb-bugreport@lfdr.de;
	Wed, 23 Oct 2024 08:50:00 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <mhiramat@kernel.org>) id 1t3X43-0003FK-3e
 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 23 Oct 2024 08:49:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Mime-Version
 :References:In-Reply-To:Message-Id:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BP6eSEFxsjgsA949k0l+eHJ/esJzxRrZwTNPvvjqZFQ=; b=mvDin2bbgbkMpIezccyVF62FF/
 +ggEAkW6Xs/lLNKdMiedVjXYWQzljhGc7OhH8faW3TqVYgJZx/HqQSBFMDQ61aMJ7EzozhGnHbjCq
 jijEESmExxusvjkfGlCd10i4weVSWq5ugNtWK5aY43FYRDjJioelpbi52aVy4/qrpYDQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Mime-Version:References:
 In-Reply-To:Message-Id:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BP6eSEFxsjgsA949k0l+eHJ/esJzxRrZwTNPvvjqZFQ=; b=bbYvxFeMHUXKHZWpoZd3rJ5ePJ
 wvMlpWFw3VCKwxTFt1tL3IvPc98jH2jZN8X/ofk7snQu7ILR5fmB7FhRym8AEvB0hYiKfVTAjVFEi
 lOCgm4uoEZV0grRL2ER6fGT5QbwaWP+EwSjFJEj5MGfobsJ+zfo7ZlZZjGyQyLBiSueQ=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t3X42-0008Lq-EI for kgdb-bugreport@lists.sourceforge.net;
 Wed, 23 Oct 2024 08:49:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 86C905C5EC0;
 Wed, 23 Oct 2024 08:49:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BB44C4CEC6;
 Wed, 23 Oct 2024 08:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729673387;
 bh=LbO3NbepQkvZk7yCTg035pexaVjgPBDZmBLuQhHYH40=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=iZMmn3+n4j1CNsLy1QLuB05dT9u9rS+PPdrTPy8VVpXISB0padJvdTeXoB9x6Hwv4
 AU974L3tZ5PkctyWTs2fGgDWjUzBztuMVWlKVgyjaM+oiJI5vk9KGE4k+LgpTBUqOd
 7DAXg1wn24wiDVAV1BdtTK5MLPSX9rWOM+l9KlKW6rWcSwhOk8uV4K1CJRCPTSiYvo
 s8qRiGPN+f1tA/EL/hG8deU+Ri5WOykQYD+c+nJfDb5FSaOtUo9CLg4u+zpkQnFdKF
 2Ny1VDz/5znszIyT57l2Io5RTq/pGdTyhVxcu81EG2leknegld/uVC+Kf+MuuTtmD2
 bC2DA3rme0YGg==
Date: Wed, 23 Oct 2024 17:49:44 +0900
To: Nir Lichtman <nir@lichtman.org>
Message-Id: <20241023174944.e85832349ef91ebff9cab31e@kernel.org>
In-Reply-To: <20241021211724.GC835676@lichtman.org>
References: <20241021211724.GC835676@lichtman.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-Spam-Score: -6.0 (------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon,
 21 Oct 2024 21:17:24 +0000 Nir Lichtman <nir@lichtman.org>
 wrote: > The function simple_strtoul performs no error checking in scenarios
 > where the input value overflows the intended output variable. > This results
 in this function successfully returning, even when [...] 
 Content analysis details:   (-6.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.5 NICE_REPLY_A           Looks like a legit reply (A)
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1t3X42-0008Lq-EI
Subject: Re: [Kgdb-bugreport] [PATCH v2 2/2] trace: kdb: Replace
 simple_strtoul with kstrtoul in kdb_ftdump
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
From: "Masami Hiramatsu \(Google\) via Kgdb-bugreport"
 <kgdb-bugreport@lists.sourceforge.net>
Reply-To: "Masami Hiramatsu \(Google\)" <mhiramat@kernel.org>
Cc: daniel.thompson@linaro.org, kgdb-bugreport@lists.sourceforge.net,
 rostedt@goodmis.org, linux-kernel@vger.kernel.org, mhiramat@kernel.org,
 jason.wessel@windriver.com, yuran.pereira@hotmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org,
 linux-trace-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Mon, 21 Oct 2024 21:17:24 +0000
Nir Lichtman <nir@lichtman.org> wrote:

> The function simple_strtoul performs no error checking in scenarios
> where the input value overflows the intended output variable.
> This results in this function successfully returning, even when the
> output does not match the input string (aka the function returns
> successfully even when the result is wrong).
> 
> Or as it was mentioned [1], "...simple_strtol(), simple_strtoll(),
> simple_strtoul(), and simple_strtoull() functions explicitly ignore
> overflows, which may lead to unexpected results in callers."
> Hence, the use of those functions is discouraged.
> 
> This patch replaces all uses of the simple_strtoul with the safer
> alternatives kstrtoint and kstrtol.
> 
> [1] https://www.kernel.org/doc/html/latest/process/deprecated.html#simple-strtol-simple-strtoll-simple-strtoul-simple-strtoull
> 

Looks good to me.

Acked-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>

Thank you,

> Signed-off-by: Yuran Pereira <yuran.pereira@hotmail.com>
> Signed-off-by: Nir Lichtman <nir@lichtman.org>
> ---
>  kernel/trace/trace_kdb.c | 15 ++++++---------
>  1 file changed, 6 insertions(+), 9 deletions(-)
> 
> diff --git a/kernel/trace/trace_kdb.c b/kernel/trace/trace_kdb.c
> index 59857a1ee44c..eadda6e05526 100644
> --- a/kernel/trace/trace_kdb.c
> +++ b/kernel/trace/trace_kdb.c
> @@ -96,23 +96,20 @@ static int kdb_ftdump(int argc, const char **argv)
>  {
>  	int skip_entries = 0;
>  	long cpu_file;
> -	char *cp;
> +	int err;
>  	int cnt;
>  	int cpu;
>  
>  	if (argc > 2)
>  		return KDB_ARGCOUNT;
>  
> -	if (argc) {
> -		skip_entries = simple_strtol(argv[1], &cp, 0);
> -		if (*cp)
> -			skip_entries = 0;
> -	}
> +	if (argc && kstrtoint(argv[1], 0, &skip_entries))
> +		return KDB_BADINT;
>  
>  	if (argc == 2) {
> -		cpu_file = simple_strtol(argv[2], &cp, 0);
> -		if (*cp || cpu_file >= NR_CPUS || cpu_file < 0 ||
> -		    !cpu_online(cpu_file))
> +		err = kstrtol(argv[2], 0, &cpu_file);
> +		if (err || cpu_file >= NR_CPUS || cpu_file < 0 ||
> +			!cpu_online(cpu_file))
>  			return KDB_BADINT;
>  	} else {
>  		cpu_file = RING_BUFFER_ALL_CPUS;
> -- 
> 2.39.2


-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
