Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 179A762454B
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 10 Nov 2022 16:14:19 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1ot9Fx-0000fd-RD
	for lists+kgdb-bugreport@lfdr.de;
	Thu, 10 Nov 2022 15:14:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daniel.thompson@linaro.org>) id 1ot9Fv-0000fM-Ur
 for kgdb-bugreport@lists.sourceforge.net;
 Thu, 10 Nov 2022 15:14:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EsQlpkhdgjoA/X5gtb5fhKMeMkf7Cp+/JUdRA+xD300=; b=Ph20AyGbCC7QwRIK4++VhEYmbd
 77d3xAbqa5zwDbNXukJUOe6sr9u7GwJmXARwpB9LEsfPSVz9JQHCM4XkrmSi2sdQ0R9Qaa4xdmtT0
 +ShixkvP40Gem0+jyrYWqW595dcwlsVZTBBCkQmR0ndiZFWB9gkK1HdofM8PnMHLJk8k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=EsQlpkhdgjoA/X5gtb5fhKMeMkf7Cp+/JUdRA+xD300=; b=BXheCREUvSFV6wAIApD5BuKaud
 HTIx1E/xTLtumLXjGHduD6hplJ6RPw5nWAGqSH1SfnL00GNTpmbrD16r9GDFVoqaQLzzO20NtV+/K
 IqbjZPt/0zGxOQIG27N1mN1vYl+sgRGPFIV1hOsjYIZYANRo0mCCQRwU1ZG6Kk5djpAM=;
Received: from mail-ed1-f51.google.com ([209.85.208.51])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1ot9Fo-003EvG-QE for kgdb-bugreport@lists.sourceforge.net;
 Thu, 10 Nov 2022 15:14:14 +0000
Received: by mail-ed1-f51.google.com with SMTP id r14so3539584edc.7
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 10 Nov 2022 07:14:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=EsQlpkhdgjoA/X5gtb5fhKMeMkf7Cp+/JUdRA+xD300=;
 b=AWBQ/Lk+9Z0VtGMU2ft5p9+bz1v7t1R8/QgNao+rXcWJUGcYB0Ov5ugk36ejJ9Ku7/
 Cw8U4yhp2ByRxc6McLCHK/TZixljABaUxNoKLgPVsHeZEnNbhs9mSW60ZV8j5djhB5Gm
 n1v6lqQaaxRdOXZdaU31DJKACREv+RJf7A/6mgM1ckeOH59NgAUQq161I5WiCStnl+wa
 JgWJNOHHprQvQ44WcNBOoeMj83wOLPkYyxAgu0LWbsQ6z8SMkH6BMj/UNMAXJ7+KuZXP
 bNKGkxSvT25Vt0M7CgrTP59V4UCo2DY0CX1D8F9MyPUmuoQ4+4thq8flUYtKNZXGlXJt
 yPxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EsQlpkhdgjoA/X5gtb5fhKMeMkf7Cp+/JUdRA+xD300=;
 b=QQ5kcH/lXk2HSG4axeK39u5x71ti1yZj53DQler1Q1hHjCoq0kPb4p46ThTGkXl2gU
 CG19L8VSI5LwKBc65qDgdSeN9KH1T8TlzONXIlGJHIHMMBg3NnlmZMtn6MdpUfk7F28b
 zJHrKndOVpCIl5VELHLW0OrX3VH0VwWmRVmSU4OCKDYZxl85Gtu17CHQ1rKVhLQsJpiI
 2ejc5vdjgwOLLdkq1qhr3McwOvVsV1oA3xwp0x26AEZL+7qmED+JmUR4x3YVlFnjIQLF
 6JoyFXt7+Y0TG7GE4VzfXLtOjPkdWybt/AK/54WdgYdOD4hyCe8z62LNU2QCuAIyWoKr
 ehUw==
X-Gm-Message-State: ACrzQf2Pp2AkNQ5K4PgFMQLQTGBGBS9RWkpabEFAoYDEQzIV9KF+pR3e
 Mazr+tXEIDW8yRHbENHzkRuxjg==
X-Google-Smtp-Source: AMsMyM6BwrXBOgANnwuXMwExKxwVm0Qv5qKIyu1ujzsqFwrJkYGQLcB/jdoZ7Ccg3mgqIc+GikfcIQ==
X-Received: by 2002:aa7:c612:0:b0:461:2915:e41d with SMTP id
 h18-20020aa7c612000000b004612915e41dmr2405122edq.184.1668093242341; 
 Thu, 10 Nov 2022 07:14:02 -0800 (PST)
Received: from frostfish ([82.132.184.39]) by smtp.gmail.com with ESMTPSA id
 n15-20020aa7db4f000000b00456d2721d93sm8460868edt.64.2022.11.10.07.13.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Nov 2022 07:14:01 -0800 (PST)
Date: Thu, 10 Nov 2022 15:13:56 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: John Ogness <john.ogness@linutronix.de>
Message-ID: <Y20VNMu1VCW2qP13@frostfish>
References: <20221107141638.3790965-1-john.ogness@linutronix.de>
 <20221107141638.3790965-38-john.ogness@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221107141638.3790965-38-john.ogness@linutronix.de>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Nov 07, 2022 at 03:22:35PM +0106, John Ogness wrote:
 > Calling tty_find_polling_driver() can lead to uart_set_options() being
 > called (via the poll_init() callback of tty_operations) to confi [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.208.51 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.51 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1ot9Fo-003EvG-QE
Subject: Re: [Kgdb-bugreport] [PATCH printk v3 37/40] tty: serial: kgdboc:
 synchronize tty_find_polling_driver() and register_console()
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

On Mon, Nov 07, 2022 at 03:22:35PM +0106, John Ogness wrote:
> Calling tty_find_polling_driver() can lead to uart_set_options() being
> called (via the poll_init() callback of tty_operations) to configure the
> uart. But uart_set_options() can also be called by register_console()
> (via the setup() callback of console).
>
> Take the console_list_lock to synchronize against register_console() and
> also use it for console list traversal. This also ensures the console list
> cannot change until the polling console has been chosen.
>
> Signed-off-by: John Ogness <john.ogness@linutronix.de>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
