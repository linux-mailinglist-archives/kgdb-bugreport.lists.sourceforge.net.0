Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 20176AE1F1B
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 20 Jun 2025 17:45:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:References:In-Reply-To:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xG364UWSdcf0QMJ4Xbihh5lPlV7hnGkHTqrTxvbp14s=; b=LwkYBVBX9scKWeGgzeLz4X7/xd
	BZrHoYbQ+/y6hMEeJ9LCKBA5ldaOQNX+COzedRmxDF+JV5nlGcLvAUTFyxRTgvMA6tyzXYsXTm2Yt
	1VDJtHogvBTjIberdhPRe926G3ByOV4M0wNXMWVBRvJWXoppYDeMyeKb+upQHAHISpRM=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1uSdvl-00087E-Vx
	for lists+kgdb-bugreport@lfdr.de;
	Fri, 20 Jun 2025 15:45:29 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <john.ogness@linutronix.de>) id 1uSdvk-00086y-Er
 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 20 Jun 2025 15:45:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:
 References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QRasoAf86UvMVNSfJDyTQbAWje5bM+KDr1G1hgdDfEs=; b=f7E2U/3uQUiYlo2MBXoFK/o5Qb
 EqGb3j4sl46iSzCGsyJ5dz3Igu1IzWM7YHkpT8JtgaUJPXzaagLx1/qmE4MMsco99maL9SN0fqu7r
 T/O0dAcgwyzM/sGsnc0aLjmlGokUGHvIsFHK0iSQC7hinR+9b5ywbJp31koi+rN4CbFw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=QRasoAf86UvMVNSfJDyTQbAWje5bM+KDr1G1hgdDfEs=; b=Y0n9o1ZyN4/v/rxCnlcva/bbTN
 9ODxKprRru0Q204EDRGBZuDXppeRPjYjtCeD/GMAk+ohahXabp/oMJR1AuJO14IVCaaOEAdp1YZNb
 XOyPhMmnS7ZxiaRn1Aut8rn232zSjuuzevF1qYVGNEBeKefGBteEqI0buKt/qRHGlsdE=;
Received: from galois.linutronix.de ([193.142.43.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uSdvj-00068E-Tr for kgdb-bugreport@lists.sourceforge.net;
 Fri, 20 Jun 2025 15:45:28 +0000
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1750434316;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QRasoAf86UvMVNSfJDyTQbAWje5bM+KDr1G1hgdDfEs=;
 b=HNJCi0Jd/ZLNOsQCSs/tAPCrfmflLF5AiXX3mwSEGz4cCYRZN6q/FhpOvb49AdmaBGvuHv
 Av3cHnDHDZTduSKOeQqFJ7cYMCN2eWwcmYdwPSDafQ3t1qu4s8i9ig13ZhrBRVxczOrrju
 7N0LHDXm88LCR7K9QGh7AuJsrZGW95ouYo2o7jJa/c3AlJPtza/EDNKODY86Do3I1aNum/
 qGWccPwOkhGInS8QsmQYadufeSmOz+DH0/mVC5U62ZbdBA9p0T4REbU9Yh99ywPGypcAA2
 2RFXBb2NkmCZPg8bZfxQylEPrkY8A7tjTUWXw3KbutCgKp1IgBRQU3jP+oYZSw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1750434316;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QRasoAf86UvMVNSfJDyTQbAWje5bM+KDr1G1hgdDfEs=;
 b=+D98VrXKw7IagiGrRJBS8PGYp+GEQTGnISyjliozgrXhhDELu8zjdPdSYVAP/Au+veoU3t
 l6wSABhaRK9NfVDg==
To: Petr Mladek <pmladek@suse.com>, Marcos Paulo de Souza <mpdesouza@suse.com>
In-Reply-To: <aFAdGas9yGB4zhqc@pathway.suse.cz>
References: <20250606-printk-cleanup-part2-v1-0-f427c743dda0@suse.com>
 <20250606-printk-cleanup-part2-v1-5-f427c743dda0@suse.com>
 <aFAdGas9yGB4zhqc@pathway.suse.cz>
Date: Fri, 20 Jun 2025 17:51:15 +0206
Message-ID: <84tt4aifhw.fsf@jogness.linutronix.de>
MIME-Version: 1.0
X-Spam-Score: 0.4 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2025-06-16, Petr Mladek <pmladek@suse.com> wrote: > On
 Fri 2025-06-06 23:53:47, Marcos Paulo de Souza wrote: >> All consoles found
 on for_each_console are registered, meaning that all of >> them ar [...] 
 Content analysis details:   (0.4 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.6 INVALID_DATE_TZ_ABSURD Invalid Date: header (timezone does not exist)
X-Headers-End: 1uSdvj-00068E-Tr
Subject: Re: [Kgdb-bugreport] [PATCH 5/7] arch: um: kmsg_dump: Don't check
 for CON_ENABLED
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
Cc: Richard Weinberger <richard@nod.at>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-um@lists.infradead.org,
 Steven Rostedt <rostedt@goodmis.org>, linux-kernel@vger.kernel.org,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Daniel Thompson <danielt@kernel.org>, linux-serial@vger.kernel.org,
 Jason Wessel <jason.wessel@windriver.com>,
 kgdb-bugreport@lists.sourceforge.net,
 Johannes Berg <johannes@sipsolutions.net>, Jiri Slaby <jirislaby@kernel.org>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On 2025-06-16, Petr Mladek <pmladek@suse.com> wrote:
> On Fri 2025-06-06 23:53:47, Marcos Paulo de Souza wrote:
>> All consoles found on for_each_console are registered, meaning that all of
>> them are CON_ENABLED. The code tries to find an active console, so check if the
>> console is not suspended instead.
>> 
>> Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>
>> ---
>>  arch/um/kernel/kmsg_dump.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>> diff --git a/arch/um/kernel/kmsg_dump.c b/arch/um/kernel/kmsg_dump.c
>> index 4190211752726593dd2847f66efd9d3a61cea982..f3025b2a813453f479d720618c630bee135d4e08 100644
>> --- a/arch/um/kernel/kmsg_dump.c
>> +++ b/arch/um/kernel/kmsg_dump.c
>> @@ -31,7 +31,7 @@ static void kmsg_dumper_stdout(struct kmsg_dumper *dumper,
>>  		 * expected to output the crash information.
>>  		 */
>>  		if (strcmp(con->name, "ttynull") != 0 &&
>> -		    (console_srcu_read_flags(con) & CON_ENABLED)) {
>> +		    (console_srcu_read_flags(con) & CON_SUSPENDED) == 0) {
>>  			break;
>
> I think that we should actually replace the check of the
> CON_ENABLE/CON_SUSPENDED flag with
>
> 		is_console_usable(con, console_srcu_read_flags(con), true)
>
> And it should be done at the beginning of the patchset before
> changing the semantic of the flags.
>
> Motivation:
>
> There is the following comment at the beginning of the function:
>
> 	/*
> 	 * If no consoles are available to output crash information, dump
> 	 * the kmsg buffer to stdout.
> 	 */
>
> The if-condition checks for:
>
>   + "ttynull" because this special console does not show any messages
>     by definition
>
>   + disabled/suspended consoles; note that this patchset is replacing
>     CON_ENABLED with CON_SUSPENDED flag because it the state is
>     changed during suspend.
>
> But it should check also for:
>
>   + whether the console is NBCON_console and does not have con->write_atomic
>     because such a console would not be able to show the messages
>     in panic().
>
> And it should also check the global "consoles_suspended" flag. Because
> consoles won't show anything when it is set.
>
> And all these is already done by "is_console_usable()" except for
> the check of "ttynull" which is very special.
>
> How does the sound, please?

FWIW, I agree with all these points.

John


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
