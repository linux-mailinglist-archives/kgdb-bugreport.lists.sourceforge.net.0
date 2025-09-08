Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BC5C2B49442
	for <lists+kgdb-bugreport@lfdr.de>; Mon,  8 Sep 2025 17:51:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zsi/LeF6ysDvR63x3LFszDMLSddvwhDtIcRqTSJFQSs=; b=MbzhEKOtWrWw+UR++bHbs2nVd2
	/9D4cElbuuTkkATJF5Gy5tgKnsafcWz2IqjUc4bwd3nJvtc3uJRt3F3GKLinIwcFCWW0sj6+anIDo
	B+O4EDPHBM5hUxTKqwiYe8148T4d4/cY+KLmBrLgO5ykIDPoGU1cQHNG03AjCn7BXaFg=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1uve9K-0008BS-KC
	for lists+kgdb-bugreport@lfdr.de;
	Mon, 08 Sep 2025 15:51:22 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pmladek@suse.com>) id 1uve9J-0008BL-5d
 for kgdb-bugreport@lists.sourceforge.net;
 Mon, 08 Sep 2025 15:51:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tSVWNylrScXe1y62XnvPM0BOnL0/TLepz30BeNFntlY=; b=Ud4y9io300s2lA5yp6j+EcdFZd
 pD9sw/50ld7vpR/nZNxTcGniVfTmR8eOrVgph6DOmnIBYOfRaOmfkBfPjBqTv5og7p5XH7q4s8voL
 gWBpu0ASZXgfA5Xr7hrIcPloei19lQeBBFsEnRmp2K9FwLc42H1GdcyguqNB5ZC89zng=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tSVWNylrScXe1y62XnvPM0BOnL0/TLepz30BeNFntlY=; b=i6B1PVNSf9D2gJ4flKU/wUTJYZ
 i5+JDvEISjs7K4WfmaeiGg1LKm5pe23WQpArPurPnR8+IK+Uon5zl7cj3eUUGceMBVL+0Xl3p+Hhq
 fxbaMSO3krnREV+cnG0P1fRQaleoFmObmxvb5ij7vwMJqNgAK3I9VA+iZiuddw3MuUmc=;
Received: from mail-ed1-f51.google.com ([209.85.208.51])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uve9I-00018Y-Nk for kgdb-bugreport@lists.sourceforge.net;
 Mon, 08 Sep 2025 15:51:21 +0000
Received: by mail-ed1-f51.google.com with SMTP id
 4fb4d7f45d1cf-6188b6f7f15so5118071a12.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 08 Sep 2025 08:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1757346669; x=1757951469; darn=lists.sourceforge.net; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=tSVWNylrScXe1y62XnvPM0BOnL0/TLepz30BeNFntlY=;
 b=K6Xu+9/xO/d1cLU2aT4C2NJwb1e05C3H/jnSERUcG7v9RvQVkkVgAxQ8hDkORZ+9Nu
 JTBzLp+5Gow/2eolA7J8jMaUp/VvMPpdwr/SDVnOiz2/czuTIZd7QK6ofvDSyYm03X9a
 PnNO8DfVm4gXM1GzsPR2wX643tCUyx14D5Djkw6OPupir1xP7yxMejsTo47WWXX7De5e
 +RtxBv/r3CKy5BVbmHMQX4VLeDhQotK/SIjN+rLBjhEKW12S8vhfafpFaxkGNOi6b87W
 lAGzMgfi9TpyE4di+bbdl7Xft/lPJCNT0TLNja8hrKUU1MH4AaMLRDOKhQsgLmKZqPoR
 ABNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757346669; x=1757951469;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tSVWNylrScXe1y62XnvPM0BOnL0/TLepz30BeNFntlY=;
 b=mW/S1vFQyuIftzV3RIiV4NX+zhOHad+yM8OvqI4hHpwhl7sSJHZWjZXGW47zrwhSp+
 1G0KEaOLr5amV/jS29rnbr1vblW8vGhDAZxKtoux6dhTV3VAMJqtuy1PeelFhCqLKIc1
 S3T4+7ShK66cEssaHwAUYkRN6Ntu2Hgcl8nk9pdQA2PjtRT+Ff83zBVE+U6mNV6qXKe6
 a8KINSqgFabGAC3IWHm27gKK4ZSnfwE+RvZzhsqCf/aeYkT5p2QMPj5Lv3GG+aiLLreA
 XH5/D2nUobJOHetfsCqFipM1vDGDtrDK3w2vjbe+ShkbuMOLoEIJEmcNEtji7D8hvDvE
 kRmg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWh5uRKWCnscUd7gwpzjCikpgrM06HREAIWv/9QrYzYSYCvWWXUe/oMGWHrTAwtisiiUPeAvh8A5T3loHJAwA==@lists.sourceforge.net
X-Gm-Message-State: AOJu0YztUGWQcwfF4AZeLf8fpuOdJM5VexG3jPkTiVFoVazeIT7azr1Z
 ykNo9bNhHA23jJrIZz+i5+D5J3QiyGLrx5/ZsqGS4LcLy8QHW7w6WRRrtynzFQfUqM4=
X-Gm-Gg: ASbGnctOzkn0j1w1eF5agFNG9NaqrgVoRTIHtO7z77zyFxZLU6+qtTb+XNfOdplk+zQ
 4q6Ps4Ne7m+41hrpcYXg3uKCGhBV2pjHAjiDI0Lce/WaxhnuCoUDZ2GihgCRY9zvPpgUETDe0gX
 Un5wlkN8t5sSHCVOMWM0pKuH8hURcNVuYOf34bqKjq+vBfysv8rKgs0gqEfXUTrHVBChSJBfbhw
 lo4IRolHCNoOeVRdX4HOdqoDM49wojVpEjk6lMLylCDQXKvzbJBABs+A4b0J3saUpKJNPMDJtW8
 6MMSll2I6UldacoNRMfkfsOIwKZ01zNwiLTUU45MRGLjtVhCiEXkEO+owVBe1BXnID+ftmoi2Cv
 s+hH8D7NF9oNARGReX0kcicDG4Fs3pFVB3rwy
X-Google-Smtp-Source: AGHT+IFg7xcTkV4isSmekN5I9cnRSz/n5xTff1o3IH8hLRh212Y5ihp6hXV9C7WQZ+WEVfGayJkoMw==
X-Received: by 2002:a05:6402:1e88:b0:628:a4fb:3b1c with SMTP id
 4fb4d7f45d1cf-628a4fb3dd2mr3913781a12.13.1757346669016; 
 Mon, 08 Sep 2025 08:51:09 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-625ef80347asm4728258a12.1.2025.09.08.08.51.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Sep 2025 08:51:08 -0700 (PDT)
Date: Mon, 8 Sep 2025 17:51:06 +0200
To: Marcos Paulo de Souza <mpdesouza@suse.com>
Message-ID: <aL77aq4gZBsn4epT@pathway.suse.cz>
References: <20250902-nbcon-kgdboc-v3-0-cd30a8106f1c@suse.com>
 <20250902-nbcon-kgdboc-v3-4-cd30a8106f1c@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250902-nbcon-kgdboc-v3-4-cd30a8106f1c@suse.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue 2025-09-02 15:33:55, Marcos Paulo de Souza wrote: >
 Function kdb_msg_write was calling con->write for any found console, > but
 it won't work on NBCON ones. In this case we should acquire the > [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.51 listed in wl.mailspike.net]
X-Headers-End: 1uve9I-00018Y-Nk
Subject: Re: [Kgdb-bugreport] [PATCH v3 4/4] kdb: Adapt kdb_msg_write to
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

On Tue 2025-09-02 15:33:55, Marcos Paulo de Souza wrote:
> Function kdb_msg_write was calling con->write for any found console,
> but it won't work on NBCON ones. In this case we should acquire the
> ownership of the console using NBCON_PRIO_EMERGENCY, since printing
> kdb messages should only be interrupted by a panic

I would end the paragraph here.

> in the case it was
> triggered by sysrq debug option.

This is not important. Also there are more ways how to trigger
panic(). For example, it might happen by an error in the kdb code.
Or I heard rumors that some HW even had a physical "trigger NMI" button.

> This is done by the
> nbcon_kdb_{acquire,release} functions.

I think that this is more or less obvious.

> At this point, the console is required to use the atomic callback. The
> console is skipped if the write_atomic callback is not set or if the
> context could not be acquired. The validation of NBCON is done by the
> console_is_usable helper. The context is released right after
> write_atomic finishes.
> 
> The oops_in_progress handling is only needed in the legacy consoles,
> so it was moved around the con->write callback.

> --- a/kernel/debug/kdb/kdb_io.c
> +++ b/kernel/debug/kdb/kdb_io.c
> @@ -589,24 +589,40 @@ static void kdb_msg_write(const char *msg, int msg_len)
>  	 */
>  	cookie = console_srcu_read_lock();
>  	for_each_console_srcu(c) {
> -		if (!(console_srcu_read_flags(c) & CON_ENABLED))
> +		struct nbcon_write_context wctxt = { };
> +		short flags = console_srcu_read_flags(c);
> +
> +		if (!console_is_usable(c, flags, true))
>  			continue;
>  		if (c == dbg_io_ops->cons)
>  			continue;
> -		if (!c->write)
> -			continue;
> -		/*
> -		 * Set oops_in_progress to encourage the console drivers to
> -		 * disregard their internal spin locks: in the current calling
> -		 * context the risk of deadlock is a bigger problem than risks
> -		 * due to re-entering the console driver. We operate directly on
> -		 * oops_in_progress rather than using bust_spinlocks() because
> -		 * the calls bust_spinlocks() makes on exit are not appropriate
> -		 * for this calling context.
> -		 */
> -		++oops_in_progress;
> -		c->write(c, msg, msg_len);
> -		--oops_in_progress;
> +
> +		if (flags & CON_NBCON) {
> +			/*
> +			 * Do not continue if the console is NBCON and the context
> +			 * can't be acquired.
> +			 */
> +			if (!nbcon_kdb_try_acquire(c, &wctxt))
> +				continue;
> +
> +			wctxt.outbuf = (char *)msg;
> +			wctxt.len = msg_len;

I double checked whether we initialized all members of the structure
correctly. And I found that we didn't. We should call here:

			nbcon_write_context_set_buf(&wctxt,
						    &pmsg.pbufs->outbuf[0],
						    pmsg.outbuf_len);

Sigh, this is easy to miss. I remember that I was not super happy
about this design. But the original code initialized the structure
on a single place...

> +			c->write_atomic(c, &wctxt);
> +			nbcon_kdb_release(&wctxt);
> +		} else {
> +			/*
> +			 * Set oops_in_progress to encourage the console drivers to
> +			 * disregard their internal spin locks: in the current calling
> +			 * context the risk of deadlock is a bigger problem than risks
> +			 * due to re-entering the console driver. We operate directly on
> +			 * oops_in_progress rather than using bust_spinlocks() because
> +			 * the calls bust_spinlocks() makes on exit are not appropriate
> +			 * for this calling context.
> +			 */
> +			++oops_in_progress;
> +			c->write(c, msg, msg_len);
> +			--oops_in_progress;
> +		}
>  		touch_nmi_watchdog();
>  	}
>  	console_srcu_read_unlock(cookie);

Best Regards,
Petr


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
