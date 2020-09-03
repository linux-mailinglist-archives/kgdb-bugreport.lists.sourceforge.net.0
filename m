Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E95A25C26B
	for <lists+kgdb-bugreport@lfdr.de>; Thu,  3 Sep 2020 16:24:43 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1kDqAL-0005El-WB
	for lists+kgdb-bugreport@lfdr.de; Thu, 03 Sep 2020 14:24:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <oleg@redhat.com>) id 1kDpTN-00053I-9O
 for kgdb-bugreport@lists.sourceforge.net; Thu, 03 Sep 2020 13:40:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HtD2ycArY4CaDPGxp0AgCfZeRokiL+8HZRMctDc7COU=; b=enJlkQCF/ton1IQfhoiA042WUO
 U7k6dx6gqfdtYV8pptn+A6vCumxvw53Xm2KbJkuna70a6js5qfiOBoKhi+V4r+Flm/3NM5UHMi40Y
 zi+z5w6u5AVYUk9wtXTKtQYAbrUpehT1VTfLu0UeLklmszuIMVYabrZFvfwVeMKlWOV4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=HtD2ycArY4CaDPGxp0AgCfZeRokiL+8HZRMctDc7COU=; b=ALhOMNNrHW2kQpK6yfpvqONJ3g
 DmtUpxpul/tWnxica+yJ2vZ/2L+TCTUQYirukDtmypq1OzLNqC68H9i7BwXMCE1c1Yta7orOmsyHE
 a6bH5YoH4k9zwZwE/QmagNyMIXx8XO7XDlb4XXyaZObwmbqgX5tRZhy845XXmClWJQhE=;
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-SHA384:256) (Exim 4.92.2)
 id 1kDpTJ-00BSFu-75
 for kgdb-bugreport@lists.sourceforge.net; Thu, 03 Sep 2020 13:40:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599140399;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HtD2ycArY4CaDPGxp0AgCfZeRokiL+8HZRMctDc7COU=;
 b=RmrqKXan4NW5ihrJaG39JMHNfkMp/gmdgVkhzSNtCpoHb2yThi2E8NYaxvsg0Um7cnAOEX
 2KRyvgVm1UhjPBlyfSgLqvIbnWLf3LG4mgeRpl2mMBgiDERKHIl1yakNmqjML5VuQfUjYZ
 5Vm6uxDZ1U0TBRquB+cyjpcHiNjghw8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-487-hE2tQMiQOVmhBt7wAYVWig-1; Thu, 03 Sep 2020 09:39:58 -0400
X-MC-Unique: hE2tQMiQOVmhBt7wAYVWig-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6773A1019629;
 Thu,  3 Sep 2020 13:39:55 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.40.192.114])
 by smtp.corp.redhat.com (Postfix) with SMTP id 4C6AF76E01;
 Thu,  3 Sep 2020 13:39:53 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
 oleg@redhat.com; Thu,  3 Sep 2020 15:39:55 +0200 (CEST)
Date: Thu, 3 Sep 2020 15:39:52 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: Davidlohr Bueso <dave@stgolabs.net>
Message-ID: <20200903133951.GG4386@redhat.com>
References: <20200831193435.22141-1-dave@stgolabs.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200831193435.22141-1-dave@stgolabs.net>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: suse.de]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [216.205.24.124 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
 [216.205.24.124 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1kDpTJ-00BSFu-75
X-Mailman-Approved-At: Thu, 03 Sep 2020 14:24:40 +0000
Subject: Re: [Kgdb-bugreport] [PATCH -next] kdb: Use newer api for tasklist
 scanning
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
Cc: daniel.thompson@linaro.org, Davidlohr Bueso <dbueso@suse.de>,
 kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 jason.wessel@windriver.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On 08/31, Davidlohr Bueso wrote:
>
> This kills the custom kdb_do_each_thread/kdb_while_each_thread
> calls used in kdb to iterate through all tasks. It is obsolete
> and racy to use tsk->thread_group, although in this particular
> case there is no concurrency so it doesn't matter. Still, lets
> trivially replace it for the newer one, maintaining semantics,
> of course.
>
> Signed-off-by: Davidlohr Bueso <dbueso@suse.de>
> ---
>  kernel/debug/kdb/kdb_bt.c      | 4 ++--
>  kernel/debug/kdb/kdb_main.c    | 8 ++++----
>  kernel/debug/kdb/kdb_private.h | 4 ----
>  3 files changed, 6 insertions(+), 10 deletions(-)

Acked-by: Oleg Nesterov <oleg@redhat.com>



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
