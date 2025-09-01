Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AA19B3EBDD
	for <lists+kgdb-bugreport@lfdr.de>; Mon,  1 Sep 2025 18:06:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:References:In-Reply-To:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tIYJiNUC3pDXqTWrFMxI/7mTsn1gN3GsVJ9kaj9Kk/4=; b=Sjgvq1QLwdKnypnrXioTYAaD33
	mEZ2tUOBQXy/RpwvcPPwt7Zqm+xh1Fu1U1RjCW8aDpo746p4fz7BnbvWbI29mXNUc0UFn8hweGe6o
	ma6G6lE46BegVnUxRqe/K1EcFXcdCLRoPyjPsyEW0Fs7W5QNAoICwkFsOrz5wXVjeaI0=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1ut736-0000NH-1G
	for lists+kgdb-bugreport@lfdr.de;
	Mon, 01 Sep 2025 16:06:28 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <john.ogness@linutronix.de>) id 1ut72y-0000N6-H8
 for kgdb-bugreport@lists.sourceforge.net;
 Mon, 01 Sep 2025 16:06:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:
 References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RV3gTTTp4ssTmWwaO0d/6rvk9d+lygaUTsck7J1Xt4c=; b=VSm5zTdgVlRFwjEFlJfJbKlP5C
 zdX0xh/af0Wr0RfZGON/4KfcGVkZhF0YCtQuIj8gMBZjDH3fk6lTGfBZoL184I8bm9/ISxF4/UEBZ
 +fi/JVOiqZxFQ8Db2+xP6jRYnJqCTzAAr2FXI/wMSapccoNnUGTjMQX8MaDh4uoyBC18=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RV3gTTTp4ssTmWwaO0d/6rvk9d+lygaUTsck7J1Xt4c=; b=HyuBNC4IzJl8qKvvAacKp1naqB
 CKBYyEGiagMhc/pjsctGwNQAqhl8uux2ZiPTP/keJTyFGDYw8rZkBJpcHCQ34ZvrUaqBbRFwmPVyV
 UdKLldRNRIJpBg/FNQFP5tfMGbo2DQeUafI73KvI97IHIiEZs58XxL3+mizkokNl3x+0=;
Received: from galois.linutronix.de ([193.142.43.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ut72x-0005C7-Nx for kgdb-bugreport@lists.sourceforge.net;
 Mon, 01 Sep 2025 16:06:20 +0000
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1756729621;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RV3gTTTp4ssTmWwaO0d/6rvk9d+lygaUTsck7J1Xt4c=;
 b=Q5Qk+127/4/N+Y7srzk9VoqJOkeBM+ICdjafJ6yX+6X+LcTaCCpJPL1AhDodutRb/81uOd
 IwDqa3m5OP3VRVpSP+cWD53EYf0JQY7nOU1EH2dUJDFVHU+5HXauucUxPiIQsd+xQDOlkm
 x79G5FYVVroDLFtts/xSFTLV1hLqDt+h6a09yezKTGaN6Xj9RcAX5cstPUjL+K1w9gRzSZ
 zaFQQWxQQt5IWteDro4vCAFb44zx9YYs8rhwekH8YqSbHFhdOXwjin9/+sV/B0bNSGXzVd
 ev6Nh8/cgHEfTxlyMSW3V8sOMW5kOBaMzQ076iCDyBWG5bXFKhqbCettqrf14Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1756729621;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RV3gTTTp4ssTmWwaO0d/6rvk9d+lygaUTsck7J1Xt4c=;
 b=2JD+Pp+eMZJFj3djv9Mo7vCURdR9J567BCk343FXBvSX/O27k0Ctukf38/AeJwi6gEt+oZ
 a9Oeusmt9Xm3IcDQ==
To: Petr Mladek <pmladek@suse.com>
In-Reply-To: <aLWHmY9_I4rbV0wG@pathway.suse.cz>
References: <20250811-nbcon-kgdboc-v2-0-c7c72bcdeaf6@suse.com>
 <20250811-nbcon-kgdboc-v2-3-c7c72bcdeaf6@suse.com>
 <aJoAYD_r7ygH9AdS@aspen.lan>
 <6035c35f72eb1ac8817396ca08aae71d097ca42c.camel@suse.com>
 <84h5xukti3.fsf@jogness.linutronix.de> <aLGoBDapczoLH9-Y@pathway.suse.cz>
 <84v7m6gqsz.fsf@jogness.linutronix.de> <aLWHmY9_I4rbV0wG@pathway.suse.cz>
Date: Mon, 01 Sep 2025 14:33:00 +0206
Message-ID: <84plca5pez.fsf@jogness.linutronix.de>
MIME-Version: 1.0
X-Spam-Score: 1.5 (+)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2025-09-01, Petr Mladek <pmladek@suse.com> wrote: > What
 about the following race? > > kdb_printf_cpu = -1 (0xffffffff) > > CPU 0xff
 CPU 0x1 > > panic() > > printk() > nbcon_atomic_flush_pending() [...] 
 Content analysis details:   (1.5 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.6 INVALID_DATE_TZ_ABSURD Invalid Date: header (timezone does not exist)
 1.1 DATE_IN_PAST_03_06     Date: is 3 to 6 hours before Received: date
X-Headers-End: 1ut72x-0005C7-Nx
Subject: Re: [Kgdb-bugreport] [PATCH v2 3/3] kdb: Adapt kdb_msg_write to
 work with NBCON consoles
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Marcos Paulo de Souza <mpdesouza@suse.com>,
 Steven Rostedt <rostedt@goodmis.org>, linux-kernel@vger.kernel.org,
 Daniel Thompson <daniel@riscstar.com>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Daniel Thompson <danielt@kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>,
 kgdb-bugreport@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On 2025-09-01, Petr Mladek <pmladek@suse.com> wrote:
> What about the following race?
>
> kdb_printf_cpu = -1  (0xffffffff)
>
> CPU 0xff				CPU 0x1
>
> 					panic()
>
> printk()
>   nbcon_atomic_flush_pending()
>      nbcon_context_try_acquire_direct()
> 	# load low byte of kdb_printf_cpu
> 	val = 0xff
>
> 					vkdb_printf()
> 					  cmpxchg(&kdb_printf_cpu, ...)
> 					  kdb_printf_cpu == 0x1
>
> 	# load higher byte of kdb_printf_cpu
> 	val = 0xff
>
> Result: CPU 0xff would be allowed to acquire the nbcon context
> 	because it thinks that vkdb_printf() got locked on this CPU.
>
> 	It is not fully artificial, see
> 	https://lwn.net/Articles/793253/#Load%20Tearing
>
> The above race is not critical. CPU 0x1 still could wait for CPU 0xff
> and acquire the nbcon context later.
>
> But it is something unexpected. I would feel more comfortable if
> we used the READ_ONCE() and be on the safe side.

Agreed.

John


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
