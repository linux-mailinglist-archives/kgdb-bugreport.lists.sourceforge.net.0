Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DB7A46225DF
	for <lists+kgdb-bugreport@lfdr.de>; Wed,  9 Nov 2022 09:52:59 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1osgpO-0005CX-Km
	for lists+kgdb-bugreport@lfdr.de;
	Wed, 09 Nov 2022 08:52:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daniel.thompson@linaro.org>) id 1osgp0-0005C7-Cx
 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 09 Nov 2022 08:52:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=crbYz3VLn9bPhdr6yskAHwJw97H6nt9Pu2v8KXje5/s=; b=mWhJRDz574IYVwz0s2JFJjqa0d
 gsOGYY0XcBJjs24pY+RedVDXQn23ejxkfvzVCIYLe5PF4LhE7lPx+JHg6aXR0JFGvaBQkVY7Cgxa4
 /0HhwUeHjRIlxqwML0JVN8vov7rVL3/kS9FScNMG0g28WJdT/Pp1dsbV+ewXiJTOuzIo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=crbYz3VLn9bPhdr6yskAHwJw97H6nt9Pu2v8KXje5/s=; b=LrOAmwvc6p/9WD41vvL3uIt8U8
 4K9uVzf3RKUT0++orQ6VSszalPOZsjI/QPCwzi5o8Xiy1D/MWAKZulFIdkqjEoDGbVb360I6rTxP/
 kdLdjHTB6uBRJ/dCWZ4L7miWBTJnzcAiLrdbRYIJGWbDEUhQhwxhNeHBahtDaBn7Amzg=;
Received: from mail-wr1-f43.google.com ([209.85.221.43])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1osgot-001aci-6s for kgdb-bugreport@lists.sourceforge.net;
 Wed, 09 Nov 2022 08:52:28 +0000
Received: by mail-wr1-f43.google.com with SMTP id y16so24611912wrt.12
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 09 Nov 2022 00:52:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=crbYz3VLn9bPhdr6yskAHwJw97H6nt9Pu2v8KXje5/s=;
 b=HcdTtvU2QhsyDAU7f7sCdpTShc07xDkmy+hTRUfeTKqlKtgb89lOV1/0QBctWKnWrM
 O9DXM8V8wUUch9Lc+IdfXiw9iXx0I/44EuJ0fgcoKlrqnUdPDzBmzeFLLcV+l1ffxr0I
 my7X+tklF2MElCF2lKksB31BDYVDbhxmoKZrqT2hmLdZTnZMbk9wdMx3vAVvHC0KThRX
 jGKP7tLMBMHELFOYE4el7Tr7ZEzGCk6hk4WKEYV/QCxW+FvpbyxMzJ0bpxzy25Oi334e
 kA/tWo2LKJQvYmsclDlxHzb9gZVggEA9l95s2Q7tA+Ulm2xY1BvTy9z9hxgfazSs3AmY
 yePA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=crbYz3VLn9bPhdr6yskAHwJw97H6nt9Pu2v8KXje5/s=;
 b=XOaUtlZ39WVmpVAcYagfMbh/C+QO0XbhAll8jhsJp0vZ1VWqgH5F9J0eyzGgmAVZ9z
 7oVjbsVOYdUU+WQjaujlAX9RAoL0gQRpTYhoaIIl3O6yVR7S7reRssisR84gJzGxKiMO
 KtaMKkxqi/ePp4HiIDTHCXYGnfsLWuPsGlKkyZFS+kDfea+a2LQ3O8JHR/aMHV4KxMFN
 S/eV6gpHZNLeO+oNp1mz5EDnJAyo1nSD5HHjoC7V2AbnmIW7Ns8qFP5EaVkVaE0LmLK3
 cGPYw6mQ0n14BdFg68U0lzZHpmEhVT3A/dUM75R3x35eJ8awxm0nVfhoZ8+umIOFExLx
 BegA==
X-Gm-Message-State: ANoB5pn8FfoixsreR7aPwCqAI/OkRaHqB+KdzPfMwCZ6O5PFd+Ie9puB
 trvwqN8riORXLySy0BpXHw9veEBfB3R6ig==
X-Google-Smtp-Source: AMsMyM6MjADOLlTlAhLz7aZOc1cO/kOSTXn41LWTwMR6auezYg1wSpunTmH84+ozvyK0CPY1elgcXQ==
X-Received: by 2002:a05:6000:180b:b0:236:5985:9c4e with SMTP id
 m11-20020a056000180b00b0023659859c4emr38084419wrh.584.1667982168896; 
 Wed, 09 Nov 2022 00:22:48 -0800 (PST)
Received: from ash.lan ([167.98.0.196]) by smtp.gmail.com with ESMTPSA id
 z9-20020a5d6409000000b00228d67db06esm12472140wru.21.2022.11.09.00.22.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Nov 2022 00:22:48 -0800 (PST)
Date: Wed, 9 Nov 2022 08:22:46 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: John Ogness <john.ogness@linutronix.de>
Message-ID: <20221109082246.vvolneae5lqmebdt@ash.lan>
References: <20221107141638.3790965-1-john.ogness@linutronix.de>
 <20221107141638.3790965-11-john.ogness@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221107141638.3790965-11-john.ogness@linutronix.de>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Nov 07, 2022 at 03:22:08PM +0106, John Ogness wrote:
 > Replace (console->flags & CON_ENABLED) usage with console_is_enabled().
 > > Signed-off-by: John Ogness <john.ogness@linutronix.de> > Revi [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.43 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.221.43 listed in list.dnswl.org]
X-Headers-End: 1osgot-001aci-6s
Subject: Re: [Kgdb-bugreport] [PATCH printk v3 10/40] kdb: kdb_io: use
 console_is_enabled()
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

On Mon, Nov 07, 2022 at 03:22:08PM +0106, John Ogness wrote:
> Replace (console->flags & CON_ENABLED) usage with console_is_enabled().
>
> Signed-off-by: John Ogness <john.ogness@linutronix.de>
> Reviewed-by: Petr Mladek <pmladek@suse.com>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
