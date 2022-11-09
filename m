Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CC79362275E
	for <lists+kgdb-bugreport@lfdr.de>; Wed,  9 Nov 2022 10:44:53 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1oshdc-0001Ya-IP
	for lists+kgdb-bugreport@lfdr.de;
	Wed, 09 Nov 2022 09:44:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <john.ogness@linutronix.de>) id 1oshdb-0001YU-Mw
 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 09 Nov 2022 09:44:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:
 References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kPAk+3cLOj2C0i9syAj3cq39vfGjg5hFSD8YkhVNKCk=; b=SlYKsXiFgh3Pe1+6EgQ2nLMv08
 HnGEDRlyCQLnXyQVrsWbKb31W5n7cndCeX0qaZI236CLZxsa40PkXRlq2D233i4UKTcKR6bglGoLy
 Y7P08SrjkN/3vXqNsX08exNqvRduqXRtwRVgJKtqcwII0D9uR7eh2IvjSK45V8Yrr77c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kPAk+3cLOj2C0i9syAj3cq39vfGjg5hFSD8YkhVNKCk=; b=lDDbZOJYB38le4kBm/Lowun2eI
 7/fH1/zetY4sAAClO7hqbVINPf8UAWtezKkD4roqv+U3nz2US/JTMQMFN7r4bT3afjTRGP3trNAEA
 VNm1M6jXubzHBYjhHDsSYKg4OBVeJLb4D+vm+kZwM5YYkY1aBwaFgMy7q6xlm6D5zrv0=;
Received: from galois.linutronix.de ([193.142.43.55])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oshdb-001eK9-3k for kgdb-bugreport@lists.sourceforge.net;
 Wed, 09 Nov 2022 09:44:51 +0000
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1667987084;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kPAk+3cLOj2C0i9syAj3cq39vfGjg5hFSD8YkhVNKCk=;
 b=KGQPt3BuMB8UxOiIeFc+7+g3uFtm5Q+FCy0D1VPuuhLPP7wqeYjclkvf1RZxSMfB6ZYBCt
 O5f5FF0udqPW6CI/S0q6BcPp+Y5RSQoTsPStReWTA85+wKkTrJjAgTbSEAeoXsA3kVvFE7
 PEXiLJdpH/khQx7aMlU8mUKl1Y4fvdVWoa8Ty7z8J5eH3ft0N/k/3y6tPQqkXFUeFJWakU
 WtOA5VwvhTYQ/TBB3pnQwMlyenIw21lmNsyYhrjRRERT4DVCo4owgVakHWDZhAnMSIzOfY
 kwrI2VjoZ+EHwYrhzKzN6fxSAY1G9IMwfNLmcCELUTNB4I5Se7wkQhlDwQTqeg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1667987084;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kPAk+3cLOj2C0i9syAj3cq39vfGjg5hFSD8YkhVNKCk=;
 b=LsawK0XIGHqnjIumlhGVKLy3i3Z9JVErl5RyBoTCpwhm33D+5Tr+t5xSfti/otQSEWiBov
 Du2+ohG3YC9rpIDQ==
To: Daniel Thompson <daniel.thompson@linaro.org>
In-Reply-To: <20221109090631.wbtar2ho45x5yanl@ash.lan>
References: <20221107141638.3790965-1-john.ogness@linutronix.de>
 <20221107141638.3790965-37-john.ogness@linutronix.de>
 <20221109090631.wbtar2ho45x5yanl@ash.lan>
Date: Wed, 09 Nov 2022 10:50:43 +0106
Message-ID: <87tu388nsk.fsf@jogness.linutronix.de>
MIME-Version: 1.0
X-Spam-Score: -1.9 (-)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022-11-09, Daniel Thompson <daniel.thompson@linaro.org>
 wrote: >> @@ -463, 9 +476,
 14 @@ static void kgdboc_earlycon_pre_exp_handler(void)
 >> * serial drivers might be OK with this, print a warning [...] 
 Content analysis details:   (-1.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [193.142.43.55 listed in list.dnswl.org]
 0.6 INVALID_DATE_TZ_ABSURD Invalid Date: header (timezone does not
 exist)
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1oshdb-001eK9-3k
Subject: Re: [Kgdb-bugreport] [PATCH printk v3 36/40] tty: serial: kgdboc:
 use console_list_lock for list traversal
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
Cc: Petr Mladek <pmladek@suse.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Steven Rostedt <rostedt@goodmis.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>, linux-serial@vger.kernel.org,
 Jason Wessel <jason.wessel@windriver.com>,
 kgdb-bugreport@lists.sourceforge.net, Thomas Gleixner <tglx@linutronix.de>,
 Jiri Slaby <jirislaby@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On 2022-11-09, Daniel Thompson <daniel.thompson@linaro.org> wrote:
>> @@ -463,9 +476,14 @@ static void kgdboc_earlycon_pre_exp_handler(void)
>>  	 * serial drivers might be OK with this, print a warning once per
>>  	 * boot if we detect this case.
>>  	 */
>> -	for_each_console(con)
>> +	cookie = console_srcu_read_lock();
>> +	for_each_console_srcu(con) {
>>  		if (con == kgdboc_earlycon_io_ops.cons)
>> -			return;
>> +			break;
>> +	}
>> +	console_srcu_read_unlock(cookie);
>> +	if (con)
>> +		return;
>
> This change isn't mentioned in the patch description.

I will move this change into its own separate patch.

    tty: serial: kgdboc: use srcu console list iterator

    Use srcu console list iteration for safe console list traversal.

Thanks.

John


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
