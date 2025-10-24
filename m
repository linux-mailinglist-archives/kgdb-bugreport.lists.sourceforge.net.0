Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FA0CC06199
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 24 Oct 2025 13:52:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WT7/ySlF8zHdjDNmh8a9jlXlS1kdESvVLPiZHFvmV48=; b=afIpCukASHeVqkzmwan/trieuH
	foyQxxJlG1ZwxlZx5LHl46AfSx8eeOkLZAYySMpkkYCuTgv3IxbnN5hAOL6j4zYXDaSsw93bixacT
	QGTyVjMwP5rCG5jGKy2MhW9CgpCO/1TUjbHpx+9o3qTQkxt0RDwg0MEXlbXE56CGWDlM=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1vCGLV-0005ju-I9
	for lists+kgdb-bugreport@lfdr.de;
	Fri, 24 Oct 2025 11:52:37 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pmladek@suse.com>) id 1vCGLU-0005jo-5y
 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 24 Oct 2025 11:52:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7e/3an1SN+QfTJV8HYIDsA1G0BlqidXgCmoIkvXXg4E=; b=eLGg7if7js2yJ6vC1QmABZSTf6
 qFxMsUjzm2ii63Ow8zjw0nm+ZRdWi/OUtyIj9AiaXF2YJHluEN+RTu2cWZvg6Sq6AJjzvdax1KF+c
 4nF6Fg01HTeAuSXx1nBWAameyo4Bnjrjpy5XB+c8Ri3HZSdb4Cqkvp0jMY8jbELk5evs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7e/3an1SN+QfTJV8HYIDsA1G0BlqidXgCmoIkvXXg4E=; b=Nltn1IVV7k0/Eo4PmjgZZorQ9G
 Kz/Z9Jgdab7ehwlmsYRdkVwpYfTq0Gabp4Y+mznsvTxZVhVaDfQK8SkTIkiQkT5W2BasvzNXehRe/
 IQUzBDDDfzQR38M00PTs2k9G1L6tGj/78SEuYawIicRLhQVumzPaQZ4ieexS9WaNafW8=;
Received: from mail-wr1-f47.google.com ([209.85.221.47])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vCGLT-0002QA-MN for kgdb-bugreport@lists.sourceforge.net;
 Fri, 24 Oct 2025 11:52:36 +0000
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-3f0ae439bc3so1290316f8f.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 24 Oct 2025 04:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1761306744; x=1761911544; darn=lists.sourceforge.net; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=7e/3an1SN+QfTJV8HYIDsA1G0BlqidXgCmoIkvXXg4E=;
 b=ItLor73l7g7au8JKVG7K9pNyC9mfKW+Thh0rE0uYvGeDcXUUQbvrTpeC+on96ryrk+
 PQvfaet4aSV+zBAeaiUBX9pV1i/+XvzKWe1uZGfzr9qibdISqwnjVFtjp54s7ZH9XZ0/
 xVcUDLfkz4sEC/sJ2O8VHvHoK77GeWdSon6oEGhFhncjstEH0SN8mpt/Hdca044iPpdA
 RZPMZlBdLF7kBTNLHFo+nchPaiEtRB6L+GpBG4E8S3AahqYS0b4IZV7YFh/qrmXr21iw
 tEqd0ZmhnVXFUzjKWeYaQgY4YIV0tAXm/0jfOeDU0VJRRnW9za4F3asIHUnAOeKSDuxG
 2kww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761306744; x=1761911544;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7e/3an1SN+QfTJV8HYIDsA1G0BlqidXgCmoIkvXXg4E=;
 b=BQArkg78uMCqevA5nkuOXoaUt5gUA471DGt8BzWF9vdB0r1TUs0YQrpu59kPLxDQlV
 7UVOw/d3kk20u3f6VV/qbqBr2PrhFsFjNwGYGTt/TmJFr0+IieKdOiHD5saSdVxQXBMM
 M2q1gH6pABg5d/M813YwsI8Jl9djDz84eaImF4GJcOtrQDEBNSrlfgid3pO5VRFW4Qbv
 F9TCViAd+ddHpiP3PZ0M3XEtriLjGTFthRRjLuLChXz85qGPU7PiTvL3t1a2VoQT1PdF
 qMclhwNhzykplERWy9UyR8PrPey7x/OzdLHMUsElq3BKgyopNIo3h+2cCq7nDYi5bI1Q
 sV4A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXASjdP5WEt04i25I8YF6F1Y2EoNC9SgZPSwMAiGL43EWOjXLkbyquEl+jNlUX8tz+FvOtKIabyje57miJYog==@lists.sourceforge.net
X-Gm-Message-State: AOJu0YwlLOJiC+mVycJQK4vD7fJacc3QIY6OuHlWJem/Qms1MMObZXyW
 JogoMriKZPBNAnk67527mc8bZBj3mX6gXWhNdodLp2ne9gIKlizaICPVgs+V0SZ0jDg=
X-Gm-Gg: ASbGnctfVRa2r+mwnv50CtrhaNc0W2dBoCaeTUVBFjt1xOL5Ll3NQARwB7+aFx1DkAl
 /CwA79Lw6li0U3hlL6rjh2c4kkrtvFkx5p6TnsRoE5rV/wtnh7wjZzpwDxRsl5A5L9sCDmO1q2f
 jljipMpVxVSrn+cE8jUBBswOezRtlf9lWigApF6vKquixafRyGYrMC8A3XVSEb/5Fe5WrUlviUG
 MbO8WE8bG2YJhIWu4X8vIjlJq0vpQK4cVArDt39rPySsRZaAuVVbjAsw7x7foPVv8YcAYw0pWhk
 roeqK3hoWL5XZlnXVE1KX/+x6Y4UrrHzxp5Awjp8YDkpM456hQXrltj+gufBQ+L7asiu3anBHyt
 WF1XjwICXQ4Z0cOFdOBPH7MTAV6+amWVaMn+q5ry9FWdEzknGDT3lULARht2OFWi1jf4KhaSh5a
 OVHFL3+0TN2m/3hQHDBfGIEE6E
X-Google-Smtp-Source: AGHT+IHz70KoqesTwTjY72XM5XeFbqMAa6sWYwIDo+lch3Yuufz1YtUbphcT02Zrk6L8CwDru2KL5Q==
X-Received: by 2002:a05:6000:2086:b0:428:3fbb:83ff with SMTP id
 ffacd0b85a97d-429907018a4mr1499102f8f.7.1761306744090; 
 Fri, 24 Oct 2025 04:52:24 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429898add8bsm8807765f8f.23.2025.10.24.04.52.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Oct 2025 04:52:23 -0700 (PDT)
Date: Fri, 24 Oct 2025 13:52:21 +0200
To: Marcos Paulo de Souza <mpdesouza@suse.com>
Message-ID: <aPtodUgB37thKUMb@pathway.suse.cz>
References: <20251016-nbcon-kgdboc-v6-0-866aac60a80e@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251016-nbcon-kgdboc-v6-0-866aac60a80e@suse.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu 2025-10-16 11:47:53, Marcos Paulo de Souza wrote: >
 In v6 the patches were rebased on top of v6.18-rc1, added Reviewed-by tags
 from > John and did some small changes suggested by him as well. > [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.47 listed in wl.mailspike.net]
X-Headers-End: 1vCGLT-0002QA-MN
Subject: Re: [Kgdb-bugreport] [PATCH v6 0/5] Handle NBCON consoles on KDB
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
From: Petr Mladek via Kgdb-bugreport <kgdb-bugreport@lists.sourceforge.net>
Reply-To: Petr Mladek <pmladek@suse.com>
Cc: John Ogness <john.ogness@linutronix.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Steven Rostedt <rostedt@goodmis.org>, linux-kernel@vger.kernel.org,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Daniel Thompson <danielt@kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>,
 kgdb-bugreport@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Thu 2025-10-16 11:47:53, Marcos Paulo de Souza wrote:
> In v6 the patches were rebased on top of v6.18-rc1, added Reviewed-by tags from
> John and did some small changes suggested by him as well.
> 
> As usual, how I tested the changes:
> 
> Testing
> -------
> 
> I did the tests using qemu and reapplying commit f79b163c4231
> ('Revert "serial: 8250: Switch to nbcon console"') created originally by
> John, just to exercise the common 8250 serial from qemu. The commit can
> be checked on [1]. I had to solve some conflicts since the code has been
> reworked after the commit was reverted.
> 
> Then I would create three different serial entries on qemu:
> -serial mon:stdio -serial pty -serial pty
> 
> And for the kernel command line I added:
> earlyprintk=serial,ttyS2 console=ttyS2 console=ttyS1 console=ttyS1 kgdboc=ttyS1,115200
> 
> Without the last patch on this patchset, when KDB is triggered, the mirroring
> only worked on the earlyprintk console, since it's using the legacy console.
> 
> With the last patch applied, KDB mirroring works on legacy and nbcon
> console. For debugging I added some messages to be printed by KDB, showing
> also the console->name and console->index, and I was able to see both
> ->write and ->write_atomic being called, and it all working together.
> 
> [1]: https://github.com/marcosps/linux/commit/618bd49f8533db85d9c322f9ad1cb0da22aca9ee
> [2]: https://lore.kernel.org/lkml/20250825022947.1596226-1-wangjinchao600@gmail.com/
> 
> Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>
> ---
> Changes in v6:
> - Rebased on top opf v6.18-rc1
> - Changed some includes, as suggedted by John
> - Reworked comments as suggested by John

> Marcos Paulo de Souza (5):
>       printk: nbcon: Export console_is_usable
>       printk: nbcon: Introduce KDB helpers
>       printk: nbcon: Allow KDB to acquire the NBCON context
>       printk: nbcon: Export nbcon_write_context_set_buf
>       kdb: Adapt kdb_msg_write to work with NBCON consoles
> 
>  include/linux/console.h   | 55 ++++++++++++++++++++++++++++++++++++
>  include/linux/kdb.h       | 16 +++++++++++
>  kernel/debug/kdb/kdb_io.c | 47 +++++++++++++++++++++----------
>  kernel/printk/internal.h  | 45 ------------------------------
>  kernel/printk/nbcon.c     | 71 +++++++++++++++++++++++++++++++++++++++++++++--
>  5 files changed, 171 insertions(+), 63 deletions(-)

JFYI, the patchset has been committed into printk/linux.git,
branch rework/nbcon-in-kdb.

Note: As promised, I have fixed the two compilation problems reported
      by the robots when committing.

Best Regards,
Petr


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
