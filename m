Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D90B9B231
	for <lists+kgdb-bugreport@lfdr.de>; Sat, 27 Apr 2019 03:32:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1hKCCd-00061u-KT
	for lists+kgdb-bugreport@lfdr.de; Sat, 27 Apr 2019 01:32:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <SRS0=3I1i=S5=goodmis.org=rostedt@kernel.org>)
 id 1hKCCa-00061m-E3
 for kgdb-bugreport@lists.sourceforge.net; Sat, 27 Apr 2019 01:32:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ezFsdmuc8HEmcDpgcMWCINbKNtNRuzqoq3jbdXlqKis=; b=UyBiIf+xjJL/tz/1qBbHawy5IA
 gm6qX0h3tIbieBJTovgorroBRUp/pcvZ0u9YwYlLjy85sOP/zJMpEMh/Ldelr1tCOqkLaV6m/QcLI
 wrIYBBWUNd5UrAfhe6mWgzTYa6WWWsHjZiRr18ABXqFvZtxilxTtZN2LZXTzgDYj830o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ezFsdmuc8HEmcDpgcMWCINbKNtNRuzqoq3jbdXlqKis=; b=KNsaw9GSJ91mhQXDgE9wUKsv8l
 3bmv4tTdL+b0wzoUdq398fN2etGbo4ZczePi44rg75jg4VoDasr9UPPTeKoUPsk4R9xMayG9FunFR
 Hgo24mNlQS1QCI4VmrNICVNsVSZeJ/w8BT5b2BwCgOzqjnVtenhqnLp1/vawk6KFg+jA=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hKCCZ-00Fr1a-2c
 for kgdb-bugreport@lists.sourceforge.net; Sat, 27 Apr 2019 01:32:28 +0000
Received: from oasis.local.home (unknown [107.18.234.154])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 799752054F;
 Sat, 27 Apr 2019 01:32:19 +0000 (UTC)
Date: Fri, 26 Apr 2019 21:32:16 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Doug Anderson <dianders@chromium.org>
Message-ID: <20190426213216.7835d14a@oasis.local.home>
In-Reply-To: <CAD=FV=XbHa3GrgVMAAcf2e0W5t1gc--Z2t0vWa9RhSo32w12zA@mail.gmail.com>
References: <20190319171206.97107-1-dianders@chromium.org>
 <CAD=FV=XbHa3GrgVMAAcf2e0W5t1gc--Z2t0vWa9RhSo32w12zA@mail.gmail.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1hKCCZ-00Fr1a-2c
Subject: Re: [Kgdb-bugreport] [PATCH v6 1/3] tracing: kdb: The skip_lines
 parameter should have been skip_entries
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
 kgdb-bugreport@lists.sourceforge.net, Brian Norris <briannorris@chromium.org>,
 LKML <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Jason Wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Fri, 26 Apr 2019 15:26:48 -0700
Doug Anderson <dianders@chromium.org> wrote:

> Hi,
> 
> On Tue, Mar 19, 2019 at 10:12 AM Douglas Anderson <dianders@chromium.org> wrote:
 
> Steven: do you know if/when you plan to take this series?  There's no
> crazy hurry and if you like I can sent a calendar alert to remember to
> ping you after 5.1 is released so you can land this in a "for 5.3"
> queue.  Just let me know.  :-)

I can add this in this to my queue for this coming merge window.

-- Steve


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
