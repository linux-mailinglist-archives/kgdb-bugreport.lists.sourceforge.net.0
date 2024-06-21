Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CF28912295
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 21 Jun 2024 12:37:33 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1sKbe8-0001wK-FE
	for lists+kgdb-bugreport@lfdr.de;
	Fri, 21 Jun 2024 10:37:31 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zhengzengkai@huawei.com>) id 1sKTGR-0000sM-VJ
 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 21 Jun 2024 01:40:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JKhxfHOMB6KnncW3S2OrNIF7IBZRga4U3eVDGHFU+Qg=; b=ljW3L4D0TSTgoVMap3A0RhnjI2
 iduvOGKfUVrdG8BvN3C6Dk3EbEHcp9RnR96x+Xs3jAEcot42PAzdvh0GTch8ZsZwWzcOdJ7603/Qd
 T7iU2iL+63jppOCVirkIYV24s8D7jc+FI/iYWKyfAbDjJz660y43pkZQtj1NXuoHrUHs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JKhxfHOMB6KnncW3S2OrNIF7IBZRga4U3eVDGHFU+Qg=; b=d83l3UniO+jCc7OHdQoGB9uLpr
 iFBg9OWWs0XWKthJ+axEcJDyZX+ZUKpOMrUl2CQGd4HGQt5QkI6DY8rII/ZOGHrfha7mWIXCsL97r
 RvE/Ly76RkvzYl/dm7uMjy1NYy5caRb09tchyLtaQqCS09dv4hWjLrm6q1MI3JahSYUg=;
Received: from szxga08-in.huawei.com ([45.249.212.255])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sKTGS-00021s-H1 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 21 Jun 2024 01:40:33 +0000
Received: from mail.maildlp.com (unknown [172.19.163.48])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4W50Lb4xHHz1N7w5;
 Fri, 21 Jun 2024 09:36:07 +0800 (CST)
Received: from kwepemd200010.china.huawei.com (unknown [7.221.188.124])
 by mail.maildlp.com (Postfix) with ESMTPS id ABF2818001C;
 Fri, 21 Jun 2024 09:40:24 +0800 (CST)
Received: from [10.174.183.193] (10.174.183.193) by
 kwepemd200010.china.huawei.com (7.221.188.124) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Fri, 21 Jun 2024 09:40:23 +0800
To: Doug Anderson <dianders@chromium.org>
References: <20240619125803.148130-1-zhengzengkai@huawei.com>
 <CAD=FV=Xi+dWZtt1oJYMgz-AKMX4EF7euASCQh0ygLhxCaaNDuw@mail.gmail.com>
Message-ID: <cdb6b464-4d01-12f3-b022-dcd8d9076f49@huawei.com>
Date: Fri, 21 Jun 2024 09:40:22 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAD=FV=Xi+dWZtt1oJYMgz-AKMX4EF7euASCQh0ygLhxCaaNDuw@mail.gmail.com>
X-Originating-IP: [10.174.183.193]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemd200010.china.huawei.com (7.221.188.124)
X-Spam-Score: -6.9 (------)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  在 2024/6/21 5:57, Doug Anderson 写道: > Hi, > > On Wed,
    Jun 19, 2024 at 5:34 AM Zheng Zengkai <zhengzengkai@huawei.com> wrote:
   >> Commit cf8e8658100d ("arch: Remove Itanium (IA-64) architecture" [...] 
 
 Content analysis details:   (-6.9 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                         [45.249.212.255 listed in sa-trusted.bondedsender.org]
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                            [45.249.212.255 listed in bl.score.senderscore.com]
  0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
                             [45.249.212.255 listed in wl.mailspike.net]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
                             high trust
                             [45.249.212.255 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -1.9 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1sKTGS-00021s-H1
X-Mailman-Approved-At: Fri, 21 Jun 2024 10:37:30 +0000
Subject: Re: [Kgdb-bugreport] [PATCH] kdb: Get rid of redundant
 kdb_curr_task()
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
From: Zheng Zengkai via Kgdb-bugreport <kgdb-bugreport@lists.sourceforge.net>
Reply-To: Zheng Zengkai <zhengzengkai@huawei.com>
Cc: pmladek@suse.com, daniel.thompson@linaro.org,
 kgdb-bugreport@lists.sourceforge.net, thorsten.blum@toblux.com,
 christophe.jaillet@wanadoo.fr, jason.wessel@windriver.com,
 yuran.pereira@hotmail.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

CuWcqCAyMDI0LzYvMjEgNTo1NywgRG91ZyBBbmRlcnNvbiDlhpnpgZM6Cj4gSGksCj4KPiBPbiBX
ZWQsIEp1biAxOSwgMjAyNCBhdCA1OjM04oCvQU0gWmhlbmcgWmVuZ2thaSA8emhlbmd6ZW5na2Fp
QGh1YXdlaS5jb20+IHdyb3RlOgo+PiBDb21taXQgY2Y4ZTg2NTgxMDBkICgiYXJjaDogUmVtb3Zl
IEl0YW5pdW0gKElBLTY0KSBhcmNoaXRlY3R1cmUiKQo+PiByZW1vdmVkIHRoZSBvbmx5IGRlZmlu
aXRpb24gb2YgbWFjcm8gX1RJRl9NQ0FfSU5JVCwgc28ga2RiX2N1cnJfdGFzaygpCj4+IGlzIGFj
dHVhbGx5IHRoZSBzYW1lIGFzIGN1cnJfdGFzaygpIG5vdyBhbmQgYmVjb21lcyByZWR1bmRhbnQu
Cj4+Cj4+IExldCdzIHJlbW92ZSB0aGUgZGVmaW5pdGlvbiBvZiBrZGJfY3Vycl90YXNrKCkgYW5k
IHJlcGxhY2UgcmVtYWluaW5nCj4+IGNhbGxzIHdpdGggY3Vycl90YXNrKCkuCj4+Cj4+IFNpZ25l
ZC1vZmYtYnk6IFpoZW5nIFplbmdrYWkgPHpoZW5nemVuZ2thaUBodWF3ZWkuY29tPgo+PiAtLS0K
Pj4gICBrZXJuZWwvZGVidWcva2RiL2tkYl9idC5jICAgICAgfCAgMiArLQo+PiAgIGtlcm5lbC9k
ZWJ1Zy9rZGIva2RiX21haW4uYyAgICB8IDE4ICsrKystLS0tLS0tLS0tLS0tLQo+PiAgIGtlcm5l
bC9kZWJ1Zy9rZGIva2RiX3ByaXZhdGUuaCB8ICAyIC0tCj4+ICAgMyBmaWxlcyBjaGFuZ2VkLCA1
IGluc2VydGlvbnMoKyksIDE3IGRlbGV0aW9ucygtKQo+IExvb2tzIHJpZ2h0IHRvIG1lLgo+Cj4g
UmV2aWV3ZWQtYnk6IERvdWdsYXMgQW5kZXJzb24gPGRpYW5kZXJzQGNocm9taXVtLm9yZz4KPgo+
IEl0J3Mgc2xpZ2h0bHkgYW5ub3lpbmcgdGhhdCB0aGlzIGlzbid0IENDZWQgYW55IGtlcm5lbCBt
YWlsaW5nIGxpc3RzCj4gdGhhdCBhcmUgdHJhY2tlZCBieSBsb3JlLmtlcm5lbC5vcmcsIGJ1dCBJ
IGd1ZXNzIHRoYXQnbGwgYmUgdXAgdG8KPiBEYW5pZWwgdG8gZmlndXJlIG91dC4gOi1QCgpTb3Jy
eSBmb3IgZm9yZ2V0dGluZyB0aGF0LCBhY3R1YWxseSBJIHJlYWxpemVkIHRoYXQgeWVzdGVyZGF5
IGFuZCByZXNlbnQgCm9uZSBwYXRjaCBDQ2VkIGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcs
CgpUaGFua3MhCgo+Cj4gLURvdWcKPiAuCj4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpLZ2RiLWJ1Z3JlcG9ydCBtYWlsaW5nIGxpc3QKS2dkYi1idWdy
ZXBvcnRAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0
L2xpc3RzL2xpc3RpbmZvL2tnZGItYnVncmVwb3J0Cg==
