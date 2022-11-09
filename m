Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F19CA6226E1
	for <lists+kgdb-bugreport@lfdr.de>; Wed,  9 Nov 2022 10:28:08 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1oshNP-00060T-N8
	for lists+kgdb-bugreport@lfdr.de;
	Wed, 09 Nov 2022 09:28:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <john.ogness@linutronix.de>) id 1oshNP-00060N-8i
 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 09 Nov 2022 09:28:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:
 References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rBWd6rB3fdMHT6oEL/e7KMDZ3KQ02pRiVMTRw5/T4Fs=; b=N/cqS/Wa83lwODpiMZRFMoth9Q
 cYL6qpNRPJoiT6t8oq/DfXNKaJwDklW+AYUk21CH0KjjvbrG2gJLt3JqDjOISMLrxmSmaqUpOPPwA
 YTwnq9UW83TatVhmCn8zgm49/BOy85HiZbuXRzXjE7ef4mft5J24wbbZ/+fDnJoVF7r8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rBWd6rB3fdMHT6oEL/e7KMDZ3KQ02pRiVMTRw5/T4Fs=; b=cCqDAYHs21wNb6D8V3OsxzTXdp
 sKF7r2rF1FgY5z2IMcvnTIlAQ5sVRbuyZHA+gCDf26v4U05jHG6u1OBPebKX8WqjdW7N63JcMaaLU
 p3WY+od8W0+j+c0nYsMC6LmSaD89UwRd7cNPZ6z9MWHffcEljvVu9cMPcHV0hOYBwnR0=;
Received: from galois.linutronix.de ([193.142.43.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oshNN-0002Wc-7c for kgdb-bugreport@lists.sourceforge.net;
 Wed, 09 Nov 2022 09:28:07 +0000
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1667986076;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rBWd6rB3fdMHT6oEL/e7KMDZ3KQ02pRiVMTRw5/T4Fs=;
 b=FfJighKGc9u3FkH5JHCszV7Aco3v/VpYXSSQedDDZQ/lWpPTEGNV0hwEW8IQ/80zZVXDvl
 kBvNEpcMV7S5PSi5IJ/G/2KAkEp3aBCSpMUV8zdhwfNzbhPPXt1C7mjDrP/sNAcKsIB7ZC
 hJPjSKupEO9xf4Vq5DS3nMujR+RQ3ng8LuCMpKsp86TlCiCMTaMDWZl+VcLCmrajCHQaJN
 IZH/ME2QlxG9O6H1E7J7wZZCgYGssS9WCwlXvUQtMS3dzRklS/1nuTJawDWyXA+NhxUEFI
 z+XolyeeTTOPH80+LiRjGbxDvQpOzXLeS0RAgRbTqcFSoLM38nTX8BZek2gcFQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1667986076;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rBWd6rB3fdMHT6oEL/e7KMDZ3KQ02pRiVMTRw5/T4Fs=;
 b=Ga1lG42zkWBk2sHyLogpfBWSoJrf/w9HW93ZPvv5qxNV/asdr3AI5W4jEdErP5K0y8Mr36
 1U/NOcrx5dl7cGBg==
To: Daniel Thompson <daniel.thompson@linaro.org>
In-Reply-To: <20221109085325.wiub564iqnewvczb@ash.lan>
References: <20221107141638.3790965-1-john.ogness@linutronix.de>
 <20221107141638.3790965-16-john.ogness@linutronix.de>
 <20221109085325.wiub564iqnewvczb@ash.lan>
Date: Wed, 09 Nov 2022 10:33:55 +0106
Message-ID: <87wn848okk.fsf@jogness.linutronix.de>
MIME-Version: 1.0
X-Spam-Score: -1.9 (-)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Daniel, On 2022-11-09,
 Daniel Thompson <daniel.thompson@linaro.org>
 wrote: >> + /* >> + * The console_srcu_read_lock() only provides safe console
 list >> + * traversal. The use of the ->write() callback relie [...] 
 Content analysis details:   (-1.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.6 INVALID_DATE_TZ_ABSURD Invalid Date: header (timezone does not
 exist)
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [193.142.43.55 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1oshNN-0002Wc-7c
Subject: Re: [Kgdb-bugreport] [PATCH printk v3 15/40] kdb: use srcu console
 list iterator
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
Cc: Petr Mladek <pmladek@suse.com>, kgdb-bugreport@lists.sourceforge.net,
 Aaron Tomlin <atomlin@redhat.com>, linux-kernel@vger.kernel.org,
 Steven Rostedt <rostedt@goodmis.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Luis Chamberlain <mcgrof@kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>,
 Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi Daniel,

On 2022-11-09, Daniel Thompson <daniel.thompson@linaro.org> wrote:
>> +	/*
>> +	 * The console_srcu_read_lock() only provides safe console list
>> +	 * traversal. The use of the ->write() callback relies on all other
>> +	 * CPUs being stopped at the moment and console drivers being able to
>> +	 * handle reentrance when @oops_in_progress is set. (Note that there
>> +	 * is no guarantee for either criteria.)
>> +	 */
>
> The debugger entry protocol does ensure that other CPUs are either
> stopped or unresponsive. In the case where the other CPU is unresponsive
> (e.g. timed out after being asked to stop) then there is a "real" printk()
> issued prior to any of the above interference with the console system to
> the developer driving the debugger gets as much clue as we can offer them
> about what is going on (typically this is emitted from regular interrupt
> context).
>
> Given this comment is part of the debugger code then for the
> oops_in_progress hack it might be more helpful to describe what
> the developer in front the debugger needs to do to have the most
> reliable debug session possible.
>
>   There is no guarantee that every console drivers can handle reentrance
>   in this way; the developer deploying the debugger is responsible for
>   ensuring that the console drivers they have selected handle reentrance
>   appropriately.

Thanks for the explanation. I will change the comment to:

	/*
	 * The console_srcu_read_lock() only provides safe console list
	 * traversal. The use of the ->write() callback relies on all other
	 * CPUs being stopped at the moment and console drivers being able to
	 * handle reentrance when @oops_in_progress is set.
	 *
	 * There is no guarantee that every console driver can handle
	 * reentrance in this way; the developer deploying the debugger
	 * is responsible for ensuring that the console drivers they
	 * have selected handle reentrance appropriately.
	 */

John


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
